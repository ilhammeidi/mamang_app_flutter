import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class SearchInput extends StatelessWidget {
  SearchInput({super.key});

  final TextEditingController _textRef = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: spacingUnit(1)),
      child: TextField(
        controller: _textRef,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          suffixIcon: IconButton(
            onPressed: _textRef.clear,
            icon: const Icon(Icons.close)
          )
        ),
      ),
    );
  }
}