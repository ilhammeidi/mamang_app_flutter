import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController _textRef = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textRef.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextField(
        controller: _textRef,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: 'Search promo, event, or anything',
          suffixIcon: _textRef.text.isNotEmpty ? IconButton(
            onPressed: () {
              setState(() {
                _textRef.clear();
              });
            },
            icon: const Icon(Icons.close)
          ) : null
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }
}