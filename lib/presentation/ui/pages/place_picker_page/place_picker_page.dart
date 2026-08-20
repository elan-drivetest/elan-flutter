import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:elan/data/api_service/google_maps_api_service.dart';
import 'package:elan/data/location_request_service/location_request_service.dart';
import 'package:elan/injection.dart';
import 'package:geolocator/geolocator.dart';

class PlacePickerPage extends StatefulWidget {
  const PlacePickerPage({super.key, this.initialAddress});

  /// An address the map should open on, for edit flows.
  ///
  /// Signup passes nothing and gets the country view, which is right when there
  /// is no address yet. Editing an existing one from the country view means
  /// panning across Canada to make a small correction, so the profile sheet
  /// passes the current value and the map opens there instead.
  ///
  /// Best-effort: if geocoding fails the picker simply falls back to the
  /// default view rather than blocking.
  final String? initialAddress;

  @override
  State<PlacePickerPage> createState() => _PlacePickerPageState();
}

class _PlacePickerPageState extends State<PlacePickerPage>
    with SingleTickerProviderStateMixin {
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();
  final _apiService = getIt<GoogleMapsApiService>();
  final _locationService = getIt<LocationRequestService>();

  GoogleMapController? _mapController;

  /// Shown before anything has been resolved, and while a lookup is in flight.
  /// Tracked as constants because Confirm has to be able to tell a real address
  /// from these — returning one of them as the instructor's address is how
  /// "Move map to select location" used to end up saved as a pickup point.
  static const String _promptLabel = 'Move map to select location';
  static const String _fetchingLabel = 'Fetching address...';

  // Approximate center of Canada
  LatLng _currentCenter = const LatLng(56.1304, -106.3468);
  String _currentAddress = _promptLabel;

  /// A locate-me request is in flight. Guards the button against double taps
  /// and drives its spinner.
  bool _isLocating = false;

  /// Country view when starting blank, street level when opening on a known
  /// address.
  static const double _countryZoom = 4;
  static const double _addressZoom = 16;

  /// Set once a precise target is known — either [PlacePickerPage.initialAddress]
  /// resolved, or a GPS fix arrived — so the map opens at street zoom rather
  /// than the country view. Either can land before or after the map is created,
  /// so both orderings check this.
  bool _hasFocusedTarget = false;

  List<Map<String, dynamic>> _predictions = [];
  bool _isDragging = false;
  Timer? _debounce;

  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: false);

    if ((widget.initialAddress?.trim().isNotEmpty ?? false)) {
      unawaited(_seedFromInitialAddress());
    } else {
      // Nothing to open on, so open on the instructor. Panning from the middle
      // of Canada to your own street every time is the slowest possible way to
      // enter an address you are almost certainly standing at.
      unawaited(_goToCurrentLocation(userInitiated: false));
    }
  }

  /// Resolves [PlacePickerPage.initialAddress] to coordinates and centres there.
  ///
  /// Deliberately non-blocking: the map renders immediately at the country view
  /// and moves once the lookup lands, rather than holding a spinner over the
  /// whole screen for a nicety.
  Future<void> _seedFromInitialAddress() async {
    final address = widget.initialAddress?.trim();
    if (address == null || address.isEmpty) return;

    try {
      final locations = await locationFromAddress(address);
      if (!mounted || locations.isEmpty) return;

      final target =
          LatLng(locations.first.latitude, locations.first.longitude);
      setState(() {
        _currentCenter = target;
        _currentAddress = address;
        _hasFocusedTarget = true;
        _searchController.text = address;
      });

      // If the map already exists the initialCameraPosition has been consumed,
      // so move it explicitly.
      await _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: target, zoom: _addressZoom),
        ),
      );
    } catch (_) {
      // No network, or an address Google cannot resolve. The picker still works
      // from the default view, so there is nothing useful to tell the user.
    }
  }

  /// Centres the map on the device's GPS fix.
  ///
  /// Shared by the automatic first load and the locate-me button, because the
  /// two differ only in how loudly they may fail. [userInitiated] taps get a
  /// reason when something goes wrong; the silent first load falls back to the
  /// country view, which is exactly where it would have started anyway.
  ///
  /// The address is deliberately **not** reverse-geocoded here — moving the
  /// camera fires `onCameraIdle`, which already does it. Doing both would spend
  /// two Places lookups on one move.
  Future<void> _goToCurrentLocation({required bool userInitiated}) async {
    if (_isLocating) return;
    if (mounted) setState(() => _isLocating = true);

    try {
      if (!await _locationService.isLocationServiceEnabled()) {
        _reportLocationProblem(
            userInitiated, 'Turn on location services to use your position.');
        return;
      }

      var permission = await _locationService.checkPermission();

      // Ask once, and only from the state where asking does something. On
      // deniedForever the OS dialog never appears, so re-requesting would just
      // stall silently.
      if (permission == LocationPermission.denied) {
        permission = await _locationService.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        _reportLocationProblem(
            userInitiated, 'Location permission is needed to find you.');
        return;
      }

      if (permission == LocationPermission.deniedForever) {
        _reportLocationProblem(
          userInitiated,
          'Location is blocked for Elan. Enable it in Settings.',
          action: const SnackBarAction(
            label: 'Settings',
            textColor: Colors.white,
            onPressed: Geolocator.openAppSettings,
          ),
        );
        return;
      }

      final result = await _locationService.getCurrentLocation();
      if (!mounted) return;

      await result.fold(
        (message) async => _reportLocationProblem(
            userInitiated, message ?? 'Could not get your location.'),
        (position) async {
          final target = LatLng(position.latitude, position.longitude);
          setState(() {
            _currentCenter = target;
            _hasFocusedTarget = true;
            if (_currentAddress == _promptLabel) {
              _currentAddress = _fetchingLabel;
            }
          });
          await _mapController?.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(target: target, zoom: _addressZoom),
            ),
          );
        },
      );
    } catch (e) {
      _reportLocationProblem(userInitiated, 'Could not get your location.');
    } finally {
      if (mounted) setState(() => _isLocating = false);
    }
  }

  /// Silent on the automatic first load, spoken when the instructor asked.
  void _reportLocationProblem(bool userInitiated, String message,
      {SnackBarAction? action}) {
    if (!userInitiated || !mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), action: action),
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _focusNode.dispose();
    _debounce?.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    if (!_focusNode.hasFocus) return;

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _fetchPredictions(_searchController.text);
    });
  }

  Future<void> _fetchPredictions(String query) async {
    if (query.trim().isEmpty) {
      if (mounted) {
        setState(() => _predictions = []);
      }
      return;
    }

    final results = await _apiService.getPlaceAutocomplete(query);

    if (mounted) {
      setState(() => _predictions = results);
    }
  }

  Future<void> _onPredictionSelected(Map<String, dynamic> prediction) async {
    _focusNode.unfocus();
    setState(() {
      _predictions = [];
      _searchController.text = prediction['description'] ?? '';
      _currentAddress = prediction['description'] ?? '';
    });

    final placeId = prediction['place_id'];
    if (placeId != null) {
      final details = await _apiService.getPlaceDetails(placeId);
      if (details != null && details['geometry'] != null) {
        final location = details['geometry']['location'];
        final latLng = LatLng(location['lat'], location['lng']);

        // State first, then the camera: awaiting `animateCamera` blocks until
        // the flight finishes, so updating after it would leave the pin label
        // stale for the duration of the animation.
        setState(() {
          _currentCenter = latLng;
        });
        await _mapController?.animateCamera(
          CameraUpdate.newLatLngZoom(latLng, _addressZoom),
        );
      }
    }
  }

  Future<void> _updateAddressFromMapCenter(LatLng target) async {
    setState(() {
      _currentCenter = target;
      _currentAddress = 'Fetching address...';
    });

    final address = await _apiService.getReverseGeocode(target);
    if (mounted && address != null) {
      setState(() {
        _currentAddress = address;
        if (!_focusNode.hasFocus) {
          _searchController.text = address;
        }
      });
    }
  }

  /// Whether [_currentAddress] is a real address rather than one of the
  /// placeholders. Confirm is disabled until this is true — otherwise the
  /// literal string "Move map to select location" could be saved as an address.
  bool get _hasResolvedAddress =>
      _currentAddress.trim().isNotEmpty &&
      _currentAddress != _promptLabel &&
      _currentAddress != _fetchingLabel;

  /// Locate-me control.
  ///
  /// Hand-rolled rather than `myLocationButtonEnabled: true`, because the
  /// platform button anchors under the top-right of the map — directly behind
  /// this screen's floating search bar. This one lives above the confirm panel
  /// where nothing overlaps it, and can show progress: a GPS fix can take
  /// several seconds, and a button that looks inert for that long gets tapped
  /// again.
  Widget _buildLocateMeButton() {
    return Semantics(
      button: true,
      label: 'Use my current location',
      child: Material(
        color: Colors.white,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.25),
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: _isLocating
              ? null
              : () => unawaited(_goToCurrentLocation(userInitiated: true)),
          child: SizedBox(
            width: 48,
            height: 48,
            child: Center(
              child: _isLocating
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
                      ),
                    )
                  : const Icon(Icons.my_location,
                      color: Color(0xFF4CAF50), size: 24),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // 1. Google Map Full Screen
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentCenter,
              zoom: _hasFocusedTarget ? _addressZoom : _countryZoom,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            compassEnabled: false,
            onMapCreated: (controller) {
              _mapController = controller;
              // Covers the other ordering: geocoding resolved before the map
              // existed, so initialCameraPosition may have been built with the
              // pre-seed values.
              if (_hasFocusedTarget) {
                unawaited(controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(target: _currentCenter, zoom: _addressZoom),
                  ),
                ));
              }
            },
            onCameraMoveStarted: () {
              setState(() {
                _isDragging = true;
                _focusNode.unfocus();
              });
            },
            onCameraMove: (position) {
              _currentCenter = position.target;
            },
            onCameraIdle: () {
              setState(() => _isDragging = false);
              _updateAddressFromMapCenter(_currentCenter);
            },
          ),

          // 2. Beautiful Animated Center Pin
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 42), // Align point to exact center
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Pulse Ripple Effect when idle
                  if (!_isDragging)
                    AnimatedBuilder(
                      animation: _pulseController,
                      builder: (context, child) {
                        return Container(
                          width: 80 * _pulseController.value,
                          height: 80 * _pulseController.value,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF4CAF50).withValues(
                                alpha: (1.0 - _pulseController.value)
                                        .clamp(0.0, 1.0) *
                                    0.4),
                          ),
                        );
                      },
                    ),
                  // The Pin Itself
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutBack,
                    transform:
                        Matrix4.translationValues(0, _isDragging ? -20 : 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF4CAF50),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF4CAF50)
                                    .withValues(alpha: 0.4),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              )
                            ],
                          ),
                          child: const Icon(Icons.location_on,
                              color: Colors.white, size: 30),
                        ),
                        // Small dot representing the exact point
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white.withValues(alpha: 0.8),
                                    blurRadius: 4,
                                    spreadRadius: 2)
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 3. Native Style Floating Search Bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  // Unified Search Bar
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28), // Pill shape
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.12),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 4),
                        // Back Button inside the search bar
                        IconButton(
                          icon: const Icon(Icons.arrow_back,
                              color: Colors.black87),
                          onPressed: () => Navigator.of(context).pop(),
                          splashRadius: 24,
                        ),
                        // Divider
                        Container(
                          height: 24,
                          width: 1,
                          color: Colors.grey.shade300,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                        ),
                        const SizedBox(width: 8),
                        // Text Field
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            focusNode: _focusNode,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search for an address...',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              filled: false,
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                            ),
                          ),
                        ),
                        // Clear Button
                        if (_searchController.text.isNotEmpty &&
                            _focusNode.hasFocus)
                          IconButton(
                            icon:
                                Icon(Icons.cancel, color: Colors.grey.shade400),
                            onPressed: () {
                              _searchController.clear();
                              setState(() => _predictions = []);
                            },
                            splashRadius: 24,
                          ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),

                  // Suggestions Dropdown
                  if (_predictions.isNotEmpty && _focusNode.hasFocus)
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: _predictions.length,
                          separatorBuilder: (_, __) =>
                              Divider(height: 1, color: Colors.grey.shade200),
                          itemBuilder: (context, index) {
                            final prediction = _predictions[index];
                            final mainText = prediction['structured_formatting']
                                    ?['main_text'] ??
                                '';
                            final secondaryText =
                                prediction['structured_formatting']
                                        ?['secondary_text'] ??
                                    '';
                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => _onPredictionSelected(prediction),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.location_on,
                                          color: Color(0xFF4CAF50), size: 22),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(mainText,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color: Colors.black87,
                                                )),
                                            const SizedBox(height: 2),
                                            Text(secondaryText,
                                                style: TextStyle(
                                                  color: Colors.grey.shade600,
                                                  fontSize: 13,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // 4. Locate-me button + bottom confirm panel.
          //
          // One Positioned holding both, so the button is laid out directly
          // above the panel and cannot drift over it on short screens. The
          // panel slides away with AnimatedSlide while the map is being
          // dragged, but that is a transform — it keeps its layout slot, so the
          // button stays anchored instead of jumping down and back.
          Positioned(
            left: 20,
            right: 20,
            bottom: 30,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildLocateMeButton(),
                const SizedBox(height: 12),
                AnimatedSlide(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOutCubic,
                  offset: _isDragging ? const Offset(0, 1.5) : Offset.zero,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _isDragging ? 0 : 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                                color: Colors.white.withValues(alpha: 0.5)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 30,
                                  offset: const Offset(0, 15))
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF4CAF50)
                                          .withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Icon(Icons.near_me,
                                        color: Color(0xFF4CAF50)),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Current Selection',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.5),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          _currentAddress,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.black87),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Container(
                                width: double.infinity,
                                height: 56,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF4CAF50)
                                            .withValues(alpha: 0.4),
                                        blurRadius: 20,
                                        offset: const Offset(0, 8),
                                      )
                                    ]),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4CAF50),
                                    foregroundColor: Colors.white,
                                    disabledBackgroundColor:
                                        Colors.grey.shade300,
                                    disabledForegroundColor:
                                        Colors.grey.shade600,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    elevation: 0,
                                  ),
                                  onPressed: _hasResolvedAddress
                                      ? () => Navigator.of(context)
                                          .pop(_currentAddress)
                                      : null,
                                  child: const Text(
                                    'Confirm Location',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
