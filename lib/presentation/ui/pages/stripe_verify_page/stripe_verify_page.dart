import 'package:elan/core/styles.dart';
import 'package:elan/core/log/app_log.dart';
import 'package:elan/presentation/bloc/instructor_info_bloc/instructor_info_bloc.dart';
import 'package:elan/presentation/bloc/stripe_onboarding_bloc/stripe_onboarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class StripeVerifyPage extends StatefulWidget {
  const StripeVerifyPage({super.key, required this.onboardUrl});
  final String onboardUrl;

  @override
  State<StripeVerifyPage> createState() => _StripeVerifyPageState();
}

class _StripeVerifyPageState extends State<StripeVerifyPage> {
  WebViewController? _controller;
  bool loading = true;
  bool pageLoading = true;
  bool loadingError = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _initWebView();
  }

  Future<void> _initWebView() async {
    // Validate URL before attempting to load
    if (widget.onboardUrl.isEmpty) {
      setState(() {
        loading = false;
        loadingError = true;
        errorMessage = 'Invalid URL: URL is empty';
      });
      AppLog.d('❌ StripeVerifyPage: Empty URL provided');
      return;
    }

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    try {
      // Try to parse the URI first to catch malformed URLs
      final uri = Uri.parse(widget.onboardUrl);

      // Validate that it's a proper HTTP/HTTPS URL
      if (!uri.hasScheme || (uri.scheme != 'http' && uri.scheme != 'https')) {
        setState(() {
          loading = false;
          loadingError = true;
          errorMessage = 'Invalid URL: Must be a valid HTTP or HTTPS URL';
        });
        AppLog.d('❌ StripeVerifyPage: Invalid URL scheme: ${uri.scheme}');
        return;
      }

      // Check for localhost or local IP addresses
      if (uri.host == 'localhost' ||
          uri.host == '127.0.0.1' ||
          uri.host.startsWith('192.168.') ||
          uri.host.startsWith('10.') ||
          uri.host.startsWith('172.')) {
        setState(() {
          loading = false;
          loadingError = true;
          errorMessage =
              'Cannot connect to localhost or local network addresses from mobile app';
        });
        AppLog.d(
            '❌ StripeVerifyPage: Localhost/local network URL detected: ${uri.host}');
        return;
      }

      AppLog.d('✅ StripeVerifyPage: Loading URL: ${widget.onboardUrl}');

      final controller = WebViewController.fromPlatformCreationParams(params)
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..loadRequest(uri)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              AppLog.d('WebView is loading (progress : $progress%)');
            },
            onPageStarted: (String url) {
              setState(() {
                pageLoading = true;
                loadingError = false;
                errorMessage = null;
              });
              AppLog.d('Page started loading: $url');
            },
            onPageFinished: (String url) {
              setState(() {
                loading = false;
                pageLoading = false;
              });
            },
            onWebResourceError: (WebResourceError error) {
              setState(() {
                loading = false;
                loadingError = true;
                pageLoading = false;
                errorMessage = error.description;
              });
              AppLog.d('❌ WebView error: ${error.description}');
            },
            onNavigationRequest: (NavigationRequest request) async {
              AppLog.d('blocking_response_navigation ->  ${request.url}');

              // 1. Detect Stripe onboarding completion
              if (request.url.contains('/onboarding/complete')) {
                context
                    .read<StripeOnboardingBloc>()
                    .add(StripeOnboardingEvent.getInfo());
                context
                    .read<InstructorInfoBloc>()
                    .add(InstructorInfoEvent.getInfo());
                if (mounted) Navigator.of(context).pop();
                return NavigationDecision.prevent;
              }

              // 2. Detect session expiration or user cancellation
              if (request.url.contains('/onboarding/refresh') ||
                  request.url.contains('/onboarding/reauth')) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Stripe onboarding cancelled or expired.'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  Navigator.of(context).pop();
                }
                return NavigationDecision.prevent;
              }

              // 3. Allow Stripe's own domains (required for multi-step onboarding redirects)
              final uri = Uri.tryParse(request.url);
              final host = uri?.host ?? '';
              if (host.endsWith('stripe.com') ||
                  host.endsWith('stripecdn.com') ||
                  host.endsWith('trustpilot.com') ||
                  host.endsWith('stripe.network')) {
                return NavigationDecision.navigate;
              }

              // 4. Allow our own backend domain for redirects
              try {
                final originalUri = Uri.parse(widget.onboardUrl);
                if (host == originalUri.host) {
                  return NavigationDecision.navigate;
                }
              } catch (_) {}

              return NavigationDecision.prevent;
            },
            onUrlChange: (UrlChange change) {
              AppLog.d('url change to ${change.url}');
            },
          ),
        )
        ..addJavaScriptChannel(
          'Toaster',
          onMessageReceived: (JavaScriptMessage message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message.message)),
            );
          },
        );

      if (controller.platform is AndroidWebViewController) {
        AndroidWebViewController.enableDebugging(true);
        (controller.platform as AndroidWebViewController)
            .setMediaPlaybackRequiresUserGesture(false);
      }

      setState(() {
        _controller = controller;
      });
    } on FormatException catch (error) {
      AppLog.d('❌ StripeVerifyPage: Invalid URL format -> $error');
      setState(() {
        loading = false;
        loadingError = true;
        pageLoading = false;
        errorMessage = 'Invalid URL format: ${error.message}';
      });
    } catch (error) {
      AppLog.d('❌ StripeVerifyPage: WebView error -> $error');
      setState(() {
        loading = false;
        loadingError = true;
        pageLoading = false;
        errorMessage = 'Failed to load page: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // 1. Try WebView back navigation if possible
        if (_controller != null && await _controller!.canGoBack()) {
          await _controller!.goBack();
          return false;
        }

        // 2. Otherwise, show a confirmation dialog
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Text('Cancel Verification?'),
            content: const Text(
                'Are you sure you want to exit? Your Stripe onboarding progress may be lost.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Continue',
                    style: TextStyle(
                        color: Color(0xFF4CAF50), fontWeight: FontWeight.bold)),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Exit'),
              ),
            ],
          ),
        );

        return shouldPop ?? false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Navigator.canPop(context)
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new,
                      color: Colors.black87),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : null,
          title: Text(
            'Verify Stripe',
            style:
                ibmPlexSerifH5Style(color: Theme.of(context).primaryColorDark),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : loadingError
                  ? _buildErrorWidget()
                  : _controller == null
                      ? const Center(
                          child: CircularProgressIndicator(
                              color: Color(0xFF4CAF50)))
                      : Stack(
                          children: [
                            WebViewWidget(controller: _controller!),
                            if (pageLoading)
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: LinearProgressIndicator(
                                  color: const Color(0xFF4CAF50),
                                  backgroundColor:
                                      const Color(0xFF4CAF50).withOpacity(0.2),
                                ),
                              ),
                          ],
                        ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 64,
            ),
            const SizedBox(height: 16),
            const Text(
              'Failed to Load Page',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage ?? 'Something went wrong. Please try again.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  loading = true;
                  loadingError = false;
                  errorMessage = null;
                });
                _initWebView();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
