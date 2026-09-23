import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LegalSection extends StatelessWidget {
  const LegalSection({super.key});

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
            child: Text(
              'LEGAL & SUPPORT',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.privacy_tip_outlined, size: 20, color: Colors.grey.shade700),
            title: const Text('Privacy Policy', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            trailing: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey.shade400),
            onTap: () => _openUrl('https://www.elanroadtestrental.ca/privacy-policy'),
          ),
          Divider(height: 1, color: Colors.grey.shade200, indent: 16, endIndent: 16),
          ListTile(
            dense: true,
            leading: Icon(Icons.description_outlined, size: 20, color: Colors.grey.shade700),
            title: const Text('Terms of Service', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            trailing: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey.shade400),
            onTap: () => _openUrl('https://www.elanroadtestrental.ca/terms'),
          ),
          Divider(height: 1, color: Colors.grey.shade200, indent: 16, endIndent: 16),
          ListTile(
            dense: true,
            leading: Icon(Icons.headset_mic_outlined, size: 20, color: Colors.grey.shade700),
            title: const Text('Contact Support', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            subtitle: Text(
              '+1 (416) 407-4757 • elan.drivetestrental@gmail.com',
              style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey.shade400),
            onTap: () => _openUrl('https://www.elanroadtestrental.ca/contact-us'),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber.shade200),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, size: 16, color: Colors.amber.shade800),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Elan Road Test Rental is an independent service and is not affiliated with, endorsed by, or sponsored by DriveTest Ontario, Serco, or the Government of Ontario.',
                      style: TextStyle(
                        fontSize: 11,
                        height: 1.3,
                        color: Colors.amber.shade900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
