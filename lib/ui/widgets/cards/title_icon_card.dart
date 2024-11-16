import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';

class TitleIconCard extends StatelessWidget {
  const TitleIconCard({
    super.key,
    required this.icon,
    required this.title,
    this.desc,
    this.flat = false,
    required this.content
  });

  final IconData icon;
  final String title;
  final String? desc;
  final bool flat;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return PaperCard(flat: flat, content: Column(children: [
      ListTile(
        leading: Icon(icon),
        title: Text(title, style: ThemeText.title2),
        subtitle: desc != null ? Text(desc!, style: ThemeText.paragraph,) : null,
      ),
      const LineList(),
      content
    ]));
  }
}