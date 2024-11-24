import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/users.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/rank_color.dart';

class UserOptions extends StatelessWidget {
  const UserOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Row(children: [
          Text('#2', style: TextStyle(fontWeight: FontWeight.bold, color: rankType('ruby'))),
          const SizedBox(width: 4),
          Icon(Icons.diamond, color: rankType('ruby'), size: 16,),
          const SizedBox(width: 4),
          Text('Ruby Div.', style: TextStyle(fontWeight: FontWeight.bold, color: rankType('ruby')),)
        ]),
      ),
      SizedBox(
        width: 32,
        height: 32,
        child: IconButton(
          onPressed: () {},
          style: ThemeButton.tonalDefault(context),
          icon: const Icon(Icons.more_horiz, size: 16),
        ),
      ),
      SizedBox(
        width: spacingUnit(1)
      ),
      SizedBox(
        width: 32,
        height: 32,
        child: IconButton(
          onPressed: () {},
          style: ThemeButton.tonalDefault(context),
          icon: const Icon(Icons.message_outlined, size: 16),
        ),
      ),
      SizedBox(
        width: spacingUnit(1)
      ),
      FilledButton(
        onPressed: () {},
        style: ThemeButton.invert(context),
        child: const Row(children: [
          Icon(Icons.person_add_outlined),
          SizedBox(width: 4),
          Text('Follow')
        ])
      )
    ]);
  }
}

class GroupOptions extends StatelessWidget {
  const GroupOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Row(children: List.generate(7, (index) {
          return Align(
            widthFactor: 0.75,
            child: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(userList[index].avatar)
            ),
          );
        })),
      ),
      SizedBox(
        width: 32,
        height: 32,
        child: IconButton(
          onPressed: () {},
          style: ThemeButton.tonalDefault(context),
          icon: const Icon(Icons.more_horiz, size: 16),
        ),
      ),
      SizedBox(
        width: spacingUnit(1)
      ),
      FilledButton(
        onPressed: () {},
        style: ThemeButton.invert(context),
        child: const Row(children: [
          Text('Join Group')
        ])
      )
    ]);
  }
}

class OptionsFixed extends StatelessWidget {
  const OptionsFixed({super.key, required this.avatar, required this.name, this.isJoin = false});

  final String avatar;
  final String name;
  final bool isJoin;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Row(children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)
          ),
          SizedBox(width: spacingUnit(1)),
          CircleAvatar(radius: 15, backgroundImage: NetworkImage(avatar)),
          SizedBox(width: spacingUnit(1)),
          Text(name, style: ThemeText.subtitle2, overflow: TextOverflow.ellipsis, maxLines: 1,)
        ]),
      ),
      SizedBox(
        width: spacingUnit(1)
      ),
      isJoin ? FilledButton(
        onPressed: () {},
        style: ThemeButton.invert(context),
        child: const Row(children: [
          Text('Join Group')
        ])
      ) : FilledButton(
        onPressed: () {},
        style: ThemeButton.invert(context),
        child: const Row(children: [
          Icon(Icons.person_add_outlined),
          SizedBox(width: 4),
          Text('Follow')
        ])
      ),
      SizedBox(
        width: spacingUnit(2)
      ),
    ]);
  }
}
