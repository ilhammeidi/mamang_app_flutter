import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/widgets/user/auth_wrap.dart';
import 'package:mamang_app_flutter/ui/widgets/user/register_form.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Get.toNamed('/welcome');
          },
          style: IconButton.styleFrom(
            backgroundColor: colorScheme.surface,
            elevation: 2,
            shadowColor: Colors.black
          ),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          TextButton(
            onPressed: () {
            Get.toNamed('/login');
          },
            child: const Row(
              children: [
                Text('LOGIN', style: TextStyle(color: Colors.white)),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward, color: Colors.white)
              ],
            )
          )
        ],
      ),
      body: const AuthWrap(content: RegisterForm())
    );
  }
}