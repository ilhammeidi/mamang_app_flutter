import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/user/auth_options.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: <Color>[ThemePalette.secondaryMain, lighten(ThemePalette.primaryMain, 0.1)]
          )
        ),
        child: Container(
          padding: EdgeInsets.all(spacingUnit(3)),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05),
            image: const DecorationImage(image: AssetImage('assets/images/welcome_bg.png'), fit: BoxFit.cover )
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
          
            /// IMAGE ILLUSTRATION
            Padding(
              padding: EdgeInsets.only(bottom: spacingUnit(3)),
              child: Image.asset('assets/images/puzzle.png', height: 200),
            ),
          
            /// TEXT
            Text('Welcome to Mamang App', style: TextStyle(fontSize: 48.sp, color: Colors.white, fontWeight: FontWeight.bold)),
            const VSpaceShort(),
            Text('Your trusted local marketplace and advertising platforms.', style: ThemeText.title2.copyWith(color: Colors.white, fontWeight: FontWeight.normal)),
            const VSpaceBig(),
          
            /// BUTTONS
            SizedBox(
              width: double.infinity,
              height: 60,
              child: FilledButton(
                onPressed: () {
                  showBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const Wrap(
                        children: [
                          AuthOptions()
                        ],
                      );
                    }
                  );
                },
                style: ThemeButton.btnBig.merge(ThemeButton.invert(context)),
                child: const Text('REGISTER', style: ThemeText.title2)
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacingUnit(3)),
              child: const Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(child: LineList()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Already have account?', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                Expanded(child: LineList()),
              ])
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: OutlinedButton(
                onPressed: () {
                  showBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const Wrap(
                        children: [
                          AuthOptions(isLogin: true)
                        ],
                      );
                    }
                  );
                },
                style: ThemeButton.btnBig.merge(ThemeButton.outlinedInvert2(context)),
                child: const Text('LOGIN', style: ThemeText.title2)
              ),
            ),
            const VSpaceBig(),
          ]),
        ),
      ),
    );
  }
}
