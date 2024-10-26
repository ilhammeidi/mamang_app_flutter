import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key, this.autofocus = false, this.hintText = 'Search promo, event, or anything'});

  final bool autofocus;
  final String hintText;

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
    return TextField(
      autofocus: widget.autofocus,
      controller: _textRef,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0)
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0)
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0)
        ),
        disabledBorder: InputBorder.none,
        alignLabelWithHint: true,
        hintText: widget.hintText,
        suffixIcon: _textRef.text.isNotEmpty ? IconButton(
          onPressed: () {
            setState(() {
              _textRef.clear();
            });
          },
          icon: const Icon(Icons.close, size: 20,)
        ) : const Icon(Icons.search, size: 20)
      ),
      onChanged: (value) {
        setState(() {});
      },
    );
  }
}