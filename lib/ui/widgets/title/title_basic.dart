import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class TitleBasic extends StatelessWidget {
  const TitleBasic({
    super.key,
    required this.title,
    this.desc
  });

  final String title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: ThemeText.title2),
        const SizedBox(height: 4),
        desc != null ? Text(desc!, overflow: TextOverflow.ellipsis) : Container(),
      ],
    );
  }
}

class TitleBasicSmall extends StatelessWidget {
  const TitleBasicSmall({
    super.key,
    required this.title,
    this.desc
  });

  final String title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        desc != null ? Text(desc!, overflow: TextOverflow.ellipsis) : Container(),
      ],
    );
  }
}