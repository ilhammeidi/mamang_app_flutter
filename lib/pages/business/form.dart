import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mamang_app_flutter/models/list_item.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/picker.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_input_box.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';
import 'package:mamang_app_flutter/ui/widgets/business/business_icon.dart';
import 'package:mamang_app_flutter/ui/widgets/title/title_basic.dart';

class BusinessForm extends StatefulWidget {
  const BusinessForm({
    super.key,
    this.name = 'VIP Business',
    this.icon = const VipIcon()
  });

  final String name;
  final Widget icon;

  @override
  State<BusinessForm> createState() => _BusinessFormState();
}

class _BusinessFormState extends State<BusinessForm> {
  final TextEditingController _chooseRef = TextEditingController();
  String? categoryTemp;

  List<ListItem> categoryOptions = [
    ListItem(
      value: 'all',
      label: 'All',
    ),
    ListItem(
      value: 'food',
      label: 'Food',
    ),
    ListItem(
      value: 'drink',
      label: 'Drink',
    ),
    ListItem(
      value: 'services',
      label: 'Services',
    ),
    ListItem(
      value: 'automotive',
      label: 'Automotive',
    ),
    ListItem(
      value: 'property',
      label: 'Property',
    ),
    ListItem(
      value: 'education',
      label: 'Education',
    ),
    ListItem(
      value: 'sport',
      label: 'Sport',
    ),
    ListItem(
      value: 'holiday',
      label: 'Holiday',
    ),
    ListItem(
      value: 'souvenir',
      label: 'Souvenir',
    ),
  ];

  void openPicker(BuildContext context) {
    openRadioPicker(
      context: context,
      options: categoryOptions,
      title: 'Choose Category',
      initialValue: categoryTemp,
      onSelected: (value) {
        if (value != null) {
          String result = categoryOptions.firstWhere((e) => e.value == value).label;
          _chooseRef.text = result;
        }
        setState(() {
          categoryTemp = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorscheme =  Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new)
        ),
        centerTitle: false,
        title: const Text('Create New Promo')
      ),
      body: Padding(
        padding: EdgeInsets.all(spacingUnit(2)),
        child: Column(children: [
          Expanded(
            child: ListView(children: [
              /// INFO
              AppInputBox(
                content: Row(children: [
                  widget.icon,
                  SizedBox(width: spacingUnit(2)),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('Promo ID', style: ThemeText.caption),
                    const SizedBox(height: 4),
                    Text('#123456', style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
                  ])
                ])
              ),
            
              const VSpace(),
              const TitleBasic(title: 'Promo Information'),
          
              /// UPLOAD PHOTO
              const VSpaceShort(),
              Container(
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: ThemeRadius.medium,
                  color: colorscheme.outline.withOpacity(0.5),
                  border: Border.all(
                    width: 1,
                    color: colorscheme.outline
                  ),
                ),
                child: Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Icon(Icons.camera_alt_rounded, size: 80, color: colorscheme.onSurfaceVariant),
                    const SizedBox(height: 4),
                    Text('Upload Photo'.toUpperCase(), style: TextStyle(color: colorscheme.onSurfaceVariant))
                  ])
                )
              ),
              const VSpaceShort(),
          
              /// INPUT FORM
              AppTextField(
                controller: _chooseRef,
                label: 'Choose Category',
                onChanged: (_) {},
                onTap: () {
                  openPicker(context);
                },
                suffix: const Icon(Icons.arrow_drop_down),
              ),
              const VSpaceShort(),
              AppTextField(label: 'Promo Title', onChanged: (_) {}),
              const VSpaceShort(),
              AppTextField(label: 'Promo Description', maxLines: 5, onChanged: (_) {}),
              const VSpace(),

            ]),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: spacingUnit(1)),
              child: FilledButton(
                onPressed: () {},
                style: ThemeButton.btnBig.merge(ThemeButton.primary),
                child: const Text('SUBMIT NEW PROMO'),
              ),
            ),
          )
        ]),
      )
    );
  }
}