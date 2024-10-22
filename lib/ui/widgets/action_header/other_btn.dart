import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class OtherBtn extends StatefulWidget {
  const OtherBtn({super.key, this.invert = false});

  final bool invert;

  @override
  State<OtherBtn> createState() => _OtherBtnState();
}

class _OtherBtnState extends State<OtherBtn> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return MenuAnchor(
      childFocusNode: _buttonFocusNode,
      alignmentOffset: const Offset(-130, 0),
      menuChildren: <Widget>[
        MenuItemButton(
          child: const Row(children: [
            Icon(Icons.store_outlined),
            SizedBox(width: 4,),
            Text('Home'),
          ]),
          onPressed: () {
            Get.offAndToNamed('/');
          },
        ),
        MenuItemButton(
          child: const Row(children: [
            Icon(Icons.help_outline_rounded),
            SizedBox(width: 4,),
            Text('Help and supports')
          ]),
          onPressed: () {
            Get.offAndToNamed('/faq');
          },
        ),
        MenuItemButton(
          child: const Row(children: [
            Icon(Icons.report_outlined),
            SizedBox(width: 4,),
            Text('Report this')
          ]),
          onPressed: () {
            Get.offAndToNamed('/contact');
          },
        ),
        MenuItemButton(
          child: const Row(children: [
            Icon(Icons.block),
            SizedBox(width: 4,),
            Text('Block this account')
          ]),
          onPressed: () {},
        )
      ],
      builder: (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          focusNode: _buttonFocusNode,
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          }, 
          icon: Icon(Icons.more_horiz_outlined, color: widget.invert ? Colors.white : colorScheme.onSurface)
        );
      },
    );
  }
}