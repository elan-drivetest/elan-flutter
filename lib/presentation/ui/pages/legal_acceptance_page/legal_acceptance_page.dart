import 'package:elan/core/styles.dart';
import 'package:elan/domain/legal/legal_status.dart';
import 'package:elan/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:elan/presentation/bloc/legal_bloc/legal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

/// Blocking "I Agree and Accept" screen.
///
/// Shown when `/legal/status` reports any required document unaccepted: a new
/// instructor, or anyone after a document version bump. Provider Agreement
/// §16: tapping "I Agree and Accept" is the electronic signature, so that
/// exact label is used and the server records version, time and IP.
///
/// The only ways out are accepting or signing out.
class LegalAcceptancePage extends StatelessWidget {
  const LegalAcceptancePage({super.key});

  /// Pushes the page over [context] sharing its [LegalBloc]. Completes once
  /// the instructor has accepted or signed out.
  static Future<void> show(BuildContext context) {
    final bloc = context.read<LegalBloc>();
    return Navigator.of(context).push<void>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => BlocProvider.value(
          value: bloc,
          child: const LegalAcceptancePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocConsumer<LegalBloc, LegalState>(
        listener: (context, state) {
          if (state.status == LegalStatusCode.loaded && !state.mustAccept) {
            Navigator.of(context).pop();
          }
          if (state.status == LegalStatusCode.error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage ??
                  'Could not record your acceptance. Please try again.'),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          final docs = state.legal?.pending ?? const <LegalDocument>[];
          final busy = state.status == LegalStatusCode.accepting ||
              state.status == LegalStatusCode.loading;
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.description_outlined,
                        size: 48, color: Color(0xFF0C8B44)),
                    const SizedBox(height: 16),
                    Text('Review and accept',
                        style: sansMedium24(color: Colors.black)),
                    const SizedBox(height: 12),
                    const Text(
                      'Before you can accept rides or receive payouts, please '
                      'read and accept the following:',
                      style: TextStyle(fontSize: 15, height: 1.4),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        children: [
                          for (final d in docs) _DocumentTile(document: d),
                          const SizedBox(height: 16),
                          const Text(
                            'By tapping "I Agree and Accept", you confirm that '
                            'you have read and understood these documents, '
                            'intend to be legally bound by them, and that '
                            'tapping the button is your electronic signature.',
                            style: TextStyle(
                                fontSize: 13,
                                height: 1.4,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: busy || docs.isEmpty
                            ? null
                            : () => context
                                .read<LegalBloc>()
                                .add(const LegalEvent.accept()),
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFF0C8B44),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: busy
                            ? const SizedBox.square(
                                dimension: 20,
                                child: CircularProgressIndicator(
                                    strokeWidth: 2, color: Colors.white))
                            : const Text('I Agree and Accept'),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: busy
                            ? null
                            : () {
                                context
                                    .read<AuthBloc>()
                                    .add(const AuthEvent.logout());
                                Navigator.of(context).pop();
                              },
                        child: const Text('Sign out'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DocumentTile extends StatelessWidget {
  const _DocumentTile({required this.document});
  final LegalDocument document;

  @override
  Widget build(BuildContext context) {
    final url = document.url;
    return Card(
      elevation: 0,
      color: Colors.grey.shade100,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(document.title,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('Version ${document.version.replaceFirst('v', '')}'),
        trailing: url == null
            ? null
            : TextButton(
                onPressed: () => launchUrl(Uri.parse(url),
                    mode: LaunchMode.inAppBrowserView),
                child: const Text('Read'),
              ),
      ),
    );
  }
}
