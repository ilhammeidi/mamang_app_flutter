import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/chat.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/chat/chat_input.dart';
import 'package:mamang_app_flutter/ui/widgets/chat/chat_message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.messageData, required this.name, required this.avatar});

  final List<MessageItem> messageData;
  final String name;
  final String avatar;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<MessageItem> initMsg = [];
  final _scrollController = ScrollController();
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  void _sendMessage(MessageItem message){
    setState(() {
      initMsg.add(message);
    });

    /// Scroll to bottom
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + kToolbarHeight + kBottomNavigationBarHeight + 32,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn
    );
  }

  @override
  void initState() {
    initMsg = widget.messageData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(widget.avatar)
          ),
          SizedBox(width: spacingUnit(1)),
          Text(widget.name, style: ThemeText.subtitle2),
        ]),
        actions: [
          MenuAnchor(
            childFocusNode: _buttonFocusNode,
            alignmentOffset: const Offset(-50, 0),
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
                icon: const Icon(Icons.more_horiz_outlined)
              );
            },
            menuChildren: <Widget>[
              MenuItemButton(
                child: const Row(children: [
                  Icon(Icons.store_outlined, size: 16),
                  SizedBox(width: 4,),
                  Text('Home'),
                ]),
                onPressed: () {
                  Get.offAndToNamed('/');
                },
              ),
              MenuItemButton(
                child: const Row(children: [
                  Icon(Icons.block, size: 16),
                  SizedBox(width: 4,),
                  Text('Block')
                ]),
                onPressed: () {
                  Get.offAndToNamed('/inbox');
                },
              ),
              MenuItemButton(
                child: const Row(children: [
                  Icon(Icons.report_outlined, size: 16),
                  SizedBox(width: 4,),
                  Text('Report')
                ]),
                onPressed: () {
                  Get.offAndToNamed('/contact');
                },
              )
            ],
          ),
        ],
      ),
      body: Column(children: [
        Expanded(
          child: ChatMessage(
            avatar: widget.avatar,
            name: widget.name,
            chatMessages: initMsg,
            scrollCtrl: _scrollController
          )
        ),
        ChatInput(sendMsg: _sendMessage)
      ]),
    );
  }
}