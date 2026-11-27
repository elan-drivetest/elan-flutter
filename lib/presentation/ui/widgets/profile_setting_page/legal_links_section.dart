import 'package:elan/core/endpoints/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Permanent links to the published legal documents (Play requires the privacy
/// policy to be reachable in-app, not only on the store listing).
class LegalLinksSection extends StatelessWidget {
  const LegalLinksSection({super.key});

  static const _links = [
    ('Privacy Policy', ApiEndpoints.privacyPolicyPageUrl),
    ('Terms of Service', ApiEndpoints.termsPageUrl),
    ('Provider Agreement', ApiEndpoints.providerAgreementPageUrl),
    ('How account deletion works', ApiEndpoints.deleteAccountPageUrl),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          for (final (label, url) in _links)
            ListTile(
              dense: true,
              title: Text(label, style: const TextStyle(fontSize: 14)),
              trailing: const Icon(Icons.open_in_new, size: 18),
              onTap: () => launchUrl(Uri.parse(url),
                  mode: LaunchMode.inAppBrowserView),
            ),
        ],
      ),
    );
  }
}
