import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/header.dart';
import 'package:mamang_app_flutter/ui/widgets/social_media/tab_menu_socmed.dart';

class SocmedMain extends StatefulWidget {
  const SocmedMain({super.key});

  @override
  State<SocmedMain> createState() => _SocmedMainState();
}

class _SocmedMainState extends State<SocmedMain> {
  int _current = 0;

  void _handleSelect(int index) {
    setState(() {
      _current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SocialMediaHeader(),
          SliverStickyHeader.builder(
            builder: (context, state) {
              return TabMenuSocmed(
                fixed: state.isPinned,
                onSelect: _handleSelect,
                current: _current
              );
            },
            sliver: SliverToBoxAdapter(
              child: Container(height: 1200, color: Colors.purple),
            ),
          )
        ]
      ),
    );
  }
}