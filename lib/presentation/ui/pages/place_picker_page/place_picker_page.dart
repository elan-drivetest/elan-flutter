import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:elan/data/api_service/google_maps_api_service.dart';
import 'package:elan/injection.dart';

class PlacePickerPage extends StatefulWidget {
  const PlacePickerPage({super.key});

  @override
  State<PlacePickerPage> createState() => _PlacePickerPageState();
}

class _PlacePickerPageState extends State<PlacePickerPage> with SingleTickerProviderStateMixin {
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();
  final _apiService = getIt<GoogleMapsApiService>();
  
  GoogleMapController? _mapController;
  
  // Approximate center of Canada
  LatLng _currentCenter = const LatLng(56.1304, -106.3468);
  String _currentAddress = 'Move map to select location';
  
  List<Map<String, dynamic>> _predictions = [];
  bool _isSearching = false;
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
        setState(() {
          _predictions = [];
          _isSearching = false;
        });
      }
      return;
    }

    setState(() => _isSearching = true);
    final results = await _apiService.getPlaceAutocomplete(query);
    
    if (mounted) {
      setState(() {
        _predictions = results;
        _isSearching = false;
      });
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
        
        _mapController?.animateCamera(
          CameraUpdate.newLatLngZoom(latLng, 16),
        );
        setState(() {
          _currentCenter = latLng;
        });
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
              zoom: 4,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            compassEnabled: false,
            onMapCreated: (controller) {
              _mapController = controller;
              // Add a slight delay then set map style if you had one
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
              padding: const EdgeInsets.only(bottom: 42), // Align point to exact center
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
                            color: const Color(0xFF4CAF50).withOpacity(
                              (1.0 - _pulseController.value).clamp(0.0, 1.0) * 0.4
                            ),
                          ),
                        );
                      },
                    ),
                  // The Pin Itself
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutBack,
                    transform: Matrix4.translationValues(0, _isDragging ? -20 : 0, 0),
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
                                color: const Color(0xFF4CAF50).withOpacity(0.4),
                                blurRadius: 15,
                                offset: const Offset(0, 8),
                              )
                            ],
                          ),
                          child: const Icon(Icons.location_on, color: Colors.white, size: 30),
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
                              BoxShadow(color: Colors.white.withOpacity(0.8), blurRadius: 4, spreadRadius: 2)
                            ]
                          ),
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
                          color: Colors.black.withOpacity(0.12),
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
                          icon: const Icon(Icons.arrow_back, color: Colors.black87),
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
                              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                            ),
                          ),
                        ),
                        // Clear Button
                        if (_searchController.text.isNotEmpty && _focusNode.hasFocus)
                          IconButton(
                            icon: Icon(Icons.cancel, color: Colors.grey.shade400),
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
                            color: Colors.black.withOpacity(0.1), 
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
                          separatorBuilder: (_, __) => Divider(height: 1, color: Colors.grey.shade200),
                          itemBuilder: (context, index) {
                            final prediction = _predictions[index];
                            final mainText = prediction['structured_formatting']?['main_text'] ?? '';
                            final secondaryText = prediction['structured_formatting']?['secondary_text'] ?? '';
                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => _onPredictionSelected(prediction),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.location_on, color: Color(0xFF4CAF50), size: 22),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              mainText, 
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600, 
                                                fontSize: 15,
                                                color: Colors.black87,
                                              )
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              secondaryText, 
                                              style: TextStyle(
                                                color: Colors.grey.shade600, 
                                                fontSize: 13,
                                              )
                                            ),
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
          
          // 4. Beautiful Bottom Confirm Panel
          Positioned(
            left: 20,
            right: 20,
            bottom: 30,
            child: AnimatedSlide(
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
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white.withOpacity(0.5)),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 30, offset: const Offset(0, 15))
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
                                  color: const Color(0xFF4CAF50).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Icon(Icons.near_me, color: Color(0xFF4CAF50)),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Current Selection',
                                      style: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w600, letterSpacing: 0.5),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _currentAddress,
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.black87),
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
                                  color: const Color(0xFF4CAF50).withOpacity(0.4),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                )
                              ]
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4CAF50),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                elevation: 0,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(_currentAddress);
                              },
                              child: const Text(
                                'Confirm Location',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 0.5),
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
          ),
        ],
      ),
    );
  }
}
