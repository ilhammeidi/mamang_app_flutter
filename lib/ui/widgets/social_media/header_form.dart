import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';

class HeaderForm extends StatelessWidget {
  const HeaderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      forceMaterialTransparency: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(1),
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ),
        ),
      ),
      leading: TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Row(children: [
          Icon(Icons.close, color: Colors.white),
          SizedBox(width: 4,),
          Text('Cancel', style: TextStyle(color: Colors.white),)
        ],),
      ),
      leadingWidth: 100,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: OutlinedButton(
            onPressed: () {},
            style: ThemeButton.btnSmall.merge(ThemeButton.outlinedWhite()),
            child: const Row(children: [
              Icon(Icons.camera_alt_outlined, size: 14,),
              SizedBox(width: 4),
              Text('Retake Photo', style: TextStyle(fontSize: 14),)
            ])
          ),
        )
      ],
    );
  }
}