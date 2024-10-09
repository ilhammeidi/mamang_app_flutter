import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:url_launcher/url_launcher.dart';


class DownloadMobileApp extends StatelessWidget {
  const DownloadMobileApp({super.key});

  Future<void> _launchUrl(link) async {
    if (!await launchUrl(link)) {
      throw Exception('Could not launch $link');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri _iosUrl = Uri.parse('https://2ly.link/20CXM');
    final Uri _androidUrl = Uri.parse('https://2ly.link/20CXO');

    return Container(
      padding: EdgeInsets.all(spacingUnit(1)),
      margin: EdgeInsets.only(bottom: spacingUnit(3)),
      child: Row(children: [
        /// APPLE BUTTON
        Flexible(
          child: InkWell(
            onTap: () {
              _launchUrl(_iosUrl);
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: ThemeRadius.small,
                color: Colors.black,
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const FaIcon(FontAwesomeIcons.apple, color: Colors.white, size: 40),
                const SizedBox(width: 16),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Download', style: ThemeText.caption.copyWith(color: Colors.white)),
                  Text('iOS App', style: ThemeText.subtitle.copyWith(color: Colors.white))
                ])
              ]),
            ),
          ),
        ),
        
        const SizedBox(width: 8),

        /// ANDROID DOWNLOAD
        Flexible(
          child: InkWell(
            onTap: () {
              _launchUrl(_androidUrl);
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: ThemeRadius.small,
                color: Colors.black
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const FaIcon(FontAwesomeIcons.android, color: Colors.green, size: 40),
                const SizedBox(width: 16),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Download', style: ThemeText.caption.copyWith(color: Colors.white)),
                  Text('Android App', style: ThemeText.subtitle.copyWith(color: Colors.white))
                ])
              ]),
            ),
          ),
        )
      ])
    );
  }
}