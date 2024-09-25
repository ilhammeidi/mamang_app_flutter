import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/pages/saved/saved_likes.dart';
import 'package:mamang_app_flutter/pages/saved/saved_promos.dart';
import 'package:mamang_app_flutter/ui/widgets/saved/header.dart';
import 'package:mamang_app_flutter/ui/widgets/saved/tab_menu.dart';

class SavedMain extends StatefulWidget {
  const SavedMain({super.key});

  @override
  State<SavedMain> createState() => _SavedMainState();
}

class _SavedMainState extends State<SavedMain> {
  int _current = 0;
  void _handleSelect(int index) {
    setState(() {
      _current = index;
    });
  }

  final List<Widget> _content = [
    SavedPromos(),
    SavedLikes(),
    const Center(child: Text('Puzzles'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SavedHeader(),
      ),
      body: Column(children: [
        TabMenu(onSelect: _handleSelect, current: _current),
        Expanded(child: _content[_current]),
      ]),
    );
  }
}