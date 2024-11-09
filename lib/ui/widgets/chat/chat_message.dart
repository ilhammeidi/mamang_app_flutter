import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/chat.dart';
import 'package:mamang_app_flutter/models/dummy_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    required this.chatMessages,
    required this.avatar,
    required this.name,
    required this.scrollCtrl}
  );

  final List<MessageItem> chatMessages;
  final String avatar;
  final String name;

  final ScrollController scrollCtrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/fabric_pattern.png',
            repeat: ImageRepeat.repeat,
          ),
        ),
        ListView.builder(
          controller: scrollCtrl,
          itemCount: chatMessages.length,
          itemBuilder: (context, index) {
            return Padding(padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: ChatBuble(
                avatar: avatar,
                name: name,
                date: chatMessages[index].date,
                isMe: chatMessages[index].isMe,
                message: chatMessages[index].message,
              )
            );
          }
        ),
      ],
    );
  }
}

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
    required this.isMe,
    required this.name,
    required this.avatar,
    required this.message,
    required this.date
  });

  final bool isMe;
  final String name;
  final String message;
  final String avatar;
  final String date;

  List<Widget> _bubleList(bool isMe, String message, String date, context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return [
      CircleAvatar(
        radius: 30,
        backgroundImage: isMe ?
          NetworkImage(userDummy.avatar)
          : NetworkImage(avatar)
      ),
      Expanded(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start, children: [
                Text(isMe ? 'Me' : name, style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(width: 8),
                Text(date, style: ThemeText.caption),
              ]),
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                  color: isMe ? colorScheme.surface : colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.only(
                    topLeft: isMe ? const Radius.circular(29) : const Radius.circular(0),
                    topRight: isMe ? const Radius.circular(0) : const Radius.circular(20),
                    bottomLeft: const Radius.circular(20),
                    bottomRight: const Radius.circular(20),
                  ),
                  border: Border.all(
                    width: 1,
                    color: ThemePalette.secondaryMain
                  )
                ),
                child: Text(message)
              )
            ]
          )
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: isMe ?
        _bubleList(isMe, message, date, context).reversed.toList()
        : _bubleList(isMe, message, date, context),
    );
  }
}