import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/chat.dart';
import 'package:mamang_app_flutter/pages/messages/chat.dart';
import 'package:mamang_app_flutter/ui/widgets/chat/chat_item.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key, required this.data});

  final List<Chat> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: ((BuildContext context, int index) {
        Chat item = data[index];
        return ChatItem(
          avatar: item.avatar,
          name: item.name,
          message: item.messages[0].message,
          date: item.messages[0].date,
          isLast: data.length == index + 1,
          onTap: () {
            Get.to(() => ChatPage(
              messageData: item.messages,
              name: item.name,
              avatar: item.avatar
            ));
          },
        );
      })
    );
  }
}