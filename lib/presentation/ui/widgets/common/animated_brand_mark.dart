import 'dart:async';

import 'package:flutter/material.dart';

/// The animated Elan wordmark shown while the app resolves its session.
///
/// **This is a continuation, not an introduction.** The native launch screen
/// (Android 12's `windowSplashScreen*`, iOS's `LaunchScreen.storyboard`) has
/// already drawn this mark on this background by the time Flutter's first frame
/// lands. So the entrance starts at 0.94 scale and 0 opacity rather than zooming
/// up from nothing — the goal is that the handoff between the OS splash and the
/// Flutter splash is invisible.
///
/// **The progress line is deliberately late.** It fades in only if work is still
/// pending after [_progressDelay]. Showing a spinner immediately means a fast
/// cold start flashes one for ~200 ms, which reads as jank rather than as
/// feedback.
///
/// **Reduced motion is honoured.** When the platform asks for it
/// (`MediaQuery.disableAnimations` — iOS "Reduce Motion", Android "Remove
/// animations"), every transition collapses to its final frame. This is an
/// accessibility requirement on both stores, not a nicety.
class AnimatedBrandMark extends StatefulWidget {
  const AnimatedBrandMark({
    super.key,
    this.width = 180,
    this.showProgress = true,
    this.accent = const Color(0xFF4CAF50),
  });

  /// Logical width of the wordmark.
  ///
  /// The source asset is only 118 px wide, so anything much above this visibly
  /// softens. Replace `assets/eclan_logo.png` with an SVG (flutter_svg is
  /// already a dependency) to scale cleanly.
  final double width;

  /// Whether to reveal a progress line when loading runs long.
  final bool showProgress;

  final Color accent;

  @override
  State<AnimatedBrandMark> createState() => _AnimatedBrandMarkState();
}

class _AnimatedBrandMarkState extends State<AnimatedBrandMark>
    with SingleTickerProviderStateMixin {
  static const Duration _entrance = Duration(milliseconds: 520);
  static const Duration _progressDelay = Duration(milliseconds: 700);

  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<double> _scale;
  late final Animation<Offset> _drift;

  Timer? _progressTimer;
  bool _showProgress = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: _entrance);

    _opacity = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.7, curve: Curves.easeOut),
    );

    // Settling *down* to 1.0 rather than growing from small keeps the mark
    // close to the size the OS splash just showed.
    _scale = Tween<double>(begin: 0.94, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _drift = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _controller.forward();

    if (widget.showProgress) {
      _progressTimer = Timer(_progressDelay, () {
        if (mounted) setState(() => _showProgress = true);
      });
    }
  }

  @override
  void dispose() {
    _progressTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduceMotion =
        MediaQuery.maybeOf(context)?.disableAnimations ?? false;

    final mark = Image.asset(
      'assets/eclan_logo.png',
      width: widget.width,
      // The asset is upscaled from 118 px; high filtering keeps the edges as
      // clean as a raster allows.
      filterQuality: FilterQuality.high,
      isAntiAlias: true,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (reduceMotion)
          mark
        else
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => Opacity(
              opacity: _opacity.value,
              child: FractionalTranslation(
                translation: _drift.value,
                child: Transform.scale(scale: _scale.value, child: child),
              ),
            ),
            child: mark,
          ),
        SizedBox(height: widget.width * 0.22),
        _ProgressLine(
          visible: _showProgress,
          width: widget.width * 0.42,
          color: widget.accent,
          reduceMotion: reduceMotion,
        ),
      ],
    );
  }
}

/// A hairline indeterminate bar — quieter than a spinner, which is too loud for
/// a brand moment. Occupies its slot even when hidden so revealing it never
/// shifts the wordmark.
class _ProgressLine extends StatelessWidget {
  const _ProgressLine({
    required this.visible,
    required this.width,
    required this.color,
    required this.reduceMotion,
  });

  final bool visible;
  final double width;
  final Color color;
  final bool reduceMotion;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2,
      width: width,
      child: AnimatedOpacity(
        opacity: visible ? 1 : 0,
        duration:
            reduceMotion ? Duration.zero : const Duration(milliseconds: 240),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1),
          child: LinearProgressIndicator(
            backgroundColor: color.withValues(alpha: 0.16),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            // A determinate bar at rest avoids an animating element for users
            // who asked for less motion, while keeping the same visual weight.
            value: reduceMotion ? 0.35 : null,
            minHeight: 2,
          ),
        ),
      ),
    );
  }
}
