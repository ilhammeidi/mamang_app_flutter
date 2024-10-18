import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/chat.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({super.key, required this.sendMsg});

  final Function(MessageItem) sendMsg;

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final textController = TextEditingController();

  void handleSendMsg(String msgVal) {
    /// Generate Message
    final generateMessage = MessageItem(
      message: msgVal,
      date: DateTime.now().toString(),
      isMe: true
    );

    /// Send Message
    widget.sendMsg(generateMessage);

    /// Clear Textfield
    textController.clear();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          top: BorderSide(color: colorScheme.outline, width: 1)
        )
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: ThemeRadius.big,
                borderSide: BorderSide(color: colorScheme.outline),
              ),
              border: OutlineInputBorder(
                borderRadius: ThemeRadius.big,
                borderSide: BorderSide(color: colorScheme.outline),
              ),
              filled: true,
              hintText: 'Write Message'
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {
            handleSendMsg(textController.text);
          },
          icon: const Icon(Icons.send, size: 24, color: Colors.white,),
          style: IconButton.styleFrom(
            backgroundColor: ThemePalette.primaryMain
          )
        )
      ]),
    );
  }
}