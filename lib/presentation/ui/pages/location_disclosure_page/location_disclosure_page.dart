import 'package:elan/core/cache/cache_manager_impl.dart';
import 'package:elan/core/styles.dart';
import 'package:elan/injection.dart';
import 'package:flutter/material.dart';

/// Google Play "prominent disclosure" for background location.
///
/// Must be shown, and accepted, **before** any OS location permission prompt.
/// Play's rules for it: in-app, shown during normal use (not buried in a
/// settings menu or the privacy policy), describes the data collected, how it
/// is used, and states that collection happens when the app is closed or not
/// in use. Do not soften that sentence; reviewers look for it.
///
/// Returns `true` from the route when the instructor taps Continue.
class LocationDisclosurePage extends StatelessWidget {
  const LocationDisclosurePage({super.key});

  /// Gate for any code that is about to trigger an OS location prompt outside
  /// `LocationBloc`: shows the disclosure if it hasn't been accepted, and
  /// records acceptance. Returns whether the caller may prompt.
  static Future<bool> ensureAccepted(BuildContext context) async {
    final cache = getIt<CacheManagerImpl>();
    if (await cache.getLocationDisclosureAccepted()) return true;
    if (!context.mounted) return false;
    final accepted = await show(context);
    if (accepted) await cache.setLocationDisclosureAccepted();
    return accepted;
  }

  static Future<bool> show(BuildContext context) async {
    final accepted = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => const LocationDisclosurePage(),
      ),
    );
    return accepted ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on_outlined,
                    size: 48, color: Color(0xFF0C8B44)),
                const SizedBox(height: 16),
                Text('Location use during rides',
                    style: sansMedium24(color: Colors.black)),
                const SizedBox(height: 16),
                const Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _Para(
                          'Elan Instructor collects location data to track '
                          'your rides, show your route, and record the '
                          'driving distance your pay is based on, even when '
                          'the app is closed or not in use.',
                          bold: true,
                        ),
                        _Bullet('Collected only while a ride you started is '
                            'in progress. Tracking stops when you stop the '
                            'ride.'),
                        _Bullet('What is collected: precise location, speed, '
                            'heading, altitude and battery level, with the '
                            'time of each point.'),
                        _Bullet('How it is used: live ride tracking, your '
                            'route on the map, ride distance and pay records, '
                            'and resolving customer or payment disputes.'),
                        _Bullet('It is sent to Elan, is not sold, and is not '
                            'used for advertising.'),
                        _Bullet('A notification is shown the whole time '
                            'tracking is active.'),
                        _Para(
                          'On the next screens, choose "Allow all the time" '
                          'so tracking continues when your screen is off. You '
                          'can change this anytime in your device settings.',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF0C8B44),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Continue'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Not now'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Para extends StatelessWidget {
  const _Para(this.text, {this.bold = false});
  final String text;
  final bool bold;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text(text,
            style: TextStyle(
                fontSize: 15,
                height: 1.4,
                fontWeight: bold ? FontWeight.w600 : FontWeight.w400)),
      );
}

class _Bullet extends StatelessWidget {
  const _Bullet(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 7, right: 10),
              child: Icon(Icons.circle, size: 6),
            ),
            Expanded(
                child: Text(text,
                    style: const TextStyle(fontSize: 15, height: 1.4))),
          ],
        ),
      );
}
