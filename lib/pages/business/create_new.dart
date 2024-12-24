import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_input_box.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';
import 'package:mamang_app_flutter/ui/widgets/business/business_icon.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_basic.dart';

class CreateNewBusiness extends StatefulWidget {
  const CreateNewBusiness({
    super.key,
    this.name = 'VIP Business',
    this.icon = const VipIcon()
  });

  final String name;
  final Widget icon;

  @override
  State<CreateNewBusiness> createState() => _CreateNewBusinessState();
}

class _CreateNewBusinessState extends State<CreateNewBusiness> {
  final _paymentKey = GlobalKey<FormState>();
  bool _active = true;
  bool _isNotValid = false;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new)
        ),
        centerTitle: true,
        title: Text(widget.name)
      ),
      body: Padding(
        padding: EdgeInsets.all(spacingUnit(2)),
        child: Form(
          key: _paymentKey,
          child: Column(children: [
            Expanded(
              child: ListView(children: [
                /// ICON
                Align(
                  alignment: Alignment.center,
                  child: Wrap(children: [
                    widget.icon,
                  ]),
                ),
                const VSpace(),
              
                /// PROMO NAME
                AppTextField(
                  label: 'Promo Name',
                  validator: FormBuilderValidators.required(),
                  errorText: _isNotValid ? 'Please fill with your promo name' : null,
                  onChanged: (_) {}
                ),
                const VSpace(),
              
                /// ACTIVATED PROMO SWITCHES
                AppInputBox(
                  content: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    const Expanded(
                      child: Text('Activate Promo Now',)
                    ),
                    Switch(
                      value: _active,
                      activeColor: ThemePalette.primaryMain,
                      onChanged: (bool value) {
                        setState(() {
                          _active = value;
                        });
                      },
                    )
                  ]),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can activate the promo later',
                    style: ThemeText.caption.copyWith(color: colorScheme.onSurfaceVariant),
                    textAlign: TextAlign.start,
                  ),
                ),
                const VSpaceBig(),
              
                /// ACTIVATION METODE
                _active ? Column(children: [
                  const TitleBasic(title: 'Choose Activation Method'),
                  const VSpaceShort(),
          
                  /// TIMER
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/payment');
                    },
                    child: AppInputBox(
                      content: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: CircleAvatar(
                          radius: 16,
                          backgroundColor: ThemePalette.primaryLight,
                          child: Icon(Icons.access_time, size: 24, color: ThemePalette.primaryMain),
                        ),
                        title: Row(
                          children: [
                            Text('Buy Timer', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(left: spacingUnit(2)),
                              child: const Text('\$2 / day'),
                            ),
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios)
                      )
                    ),
                  ),
                  const VSpaceShort(),
              
                  // /// POINT
                  AppInputBox(
                    content: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading: CircleAvatar(
                        radius: 16,
                        backgroundColor: ThemePalette.secondaryLight,
                        child: Icon(Icons.stars_rounded, size: 24, color: ThemePalette.secondaryMain),
                      ),
                      title: Row(
                        children: [
                          Text('Use Points', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(left: spacingUnit(2)),
                            child: const Text('10 points / day'),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios)
                    )
                  ),
                  const VSpaceShort(),
              
                  /// GET MEMBERs
                  AppInputBox(
                    content: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading: CircleAvatar(
                        radius: 16,
                        backgroundColor: ThemePalette.tertiaryLight,
                        child: Icon(Icons.person_add, size: 24, color: ThemePalette.tertiaryMain),
                      ),
                      title: Row(
                        children: [
                          Text('Get Members', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(left: spacingUnit(2)),
                            child: const Text('Scan Barcode'),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios)
                    )
                  ),
                  const VSpaceShort(),
              
                  /// WATCH ADS
                  AppInputBox(
                    content: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading: CircleAvatar(
                        radius: 16,
                        backgroundColor: Theme.of(context).colorScheme.outline,
                        child: Icon(Icons.play_arrow_outlined, size: 24, color: ThemePalette.tertiaryMain),
                      ),
                      title: Row(
                        children: [
                          Text('Watch Ads', style: ThemeText.subtitle.copyWith(fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(left: spacingUnit(2)),
                            child: const Text('FREE'),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios)
                    )
                  ),
                  const VSpace(),
                ]) : Container(),
            
              ]),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding (
                padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
                child: FilledButton(
                  onPressed: () {
                    if (_paymentKey.currentState!.validate()) {
                      Get.toNamed('/business-new/form');
                    } else {
                      setState(() {
                        _isNotValid = true;
                      });
                    }
                  },
                  style: ThemeButton.btnBig.merge(ThemeButton.primary),
                  child: const Text('CONTINUE'),
                ),
              ),
            )
          ]),
        ),
      )
    );
  }
}