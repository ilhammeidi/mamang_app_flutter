import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/grabber_icon.dart';
import 'package:get/route_manager.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({super.key, this.isLogin = false});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Padding(
        padding: EdgeInsets.all(spacingUnit(2)),
        child: Stack(children: [
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close, color: colorScheme.outlineVariant)
            )
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const GrabberIcon(),
            const VSpace(),
            Text('Choose ${isLogin ? 'Login' : 'Register'} Method', style: ThemeText.title2.copyWith(fontWeight: FontWeight.w700)),
            const VSpace(),
          
            // SOCIAL MEDIA BUTTONS
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white
                ),
                child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  FaIcon(FontAwesomeIcons.google),
                  SizedBox(width: 8),
                  Text('Continue with Google', style: ThemeText.subtitle,)
                ])
              ),
            ),
            const VSpace(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 33, 65, 243),
                  foregroundColor: Colors.white
                ),
                child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  FaIcon(FontAwesomeIcons.facebook),
                  SizedBox(width: 8),
                  Text('Continue with Facebook', style: ThemeText.subtitle,)
                ])
              ),
            ),
            const VSpace(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white
                ),
                child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  FaIcon(FontAwesomeIcons.xTwitter),
                  SizedBox(width: 8),
                  Text('Continue with X', style: ThemeText.subtitle,)
                ])
              ),
            ),
            const VSpace(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: colorScheme.onSurface,
                  side: BorderSide(color: colorScheme.onSurface)
                ),
                child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  FaIcon(FontAwesomeIcons.apple),
                  SizedBox(width: 8),
                  Text('Continue with Apple', style: ThemeText.subtitle,)
                ])
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacingUnit(2)),
              child: const Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(child: LineList()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('OR', style: TextStyle(fontSize: 18)),
                ),
                Expanded(child: LineList()),
              ])
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton(
                onPressed: () {
                  if(isLogin) {
                    Get.toNamed('/login');
                  } else {
                    Get.toNamed('/register');
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.primaryContainer,
                  foregroundColor: colorScheme.onPrimaryContainer,
                ),
                child: Text('Continue with Email or Phone Number', style: ThemeText.paragraph.copyWith(fontWeight: FontWeight.w700),)
              ),
            ),
            const VSpaceBig()
          ]),
        ])
      ),
    );
  }
}