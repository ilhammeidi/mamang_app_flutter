import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/models/img_api.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/cards/paper_card.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';
import 'package:mamang_app_flutter/ui/utils/image_viewer.dart';

class AddressPanel extends StatelessWidget {
  const AddressPanel({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final String avatar = ImgApi.photo[59];
    const String name = 'Indisains Software House';
    const String address = 'Jl. Raya Sanggingan Banjar Lungsiakan, Kedewatan, Kecamatan Ubud, Kabupaten Gianyar, Bali 80571';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (context) {
              return Wrap(
                children: [
                  DetailBusiness(
                    avatar: avatar,
                    name: name,
                    address: address,
                  )
                ]
              );
            },
          );
        },
        child: PaperCard(
          flat: true,
          content: Padding(
            padding: EdgeInsets.all(spacingUnit(1)),
            child: Row(children: [
              CircleAvatar(
                radius: 15.r,
                backgroundColor: colorScheme.surface,
                child: CircleAvatar(
                  radius: 14.r,
                  backgroundImage: NetworkImage(avatar),
                )
              ),
              SizedBox(width: spacingUnit(1)),
              const Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(name, overflow: TextOverflow.ellipsis, style: ThemeText.subtitle),
                  Text(address, overflow: TextOverflow.ellipsis, style: ThemeText.caption),
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class DetailBusiness extends StatefulWidget {
  const DetailBusiness({super.key, required this.avatar, required this.name, required this.address});

  final String avatar;
  final String name;
  final String address;

  @override
  State<DetailBusiness> createState() => _DetailBusinessState();
}

class _DetailBusinessState extends State<DetailBusiness> {
  final _editBusinessKey = GlobalKey<FormState>();
  bool _isNotValid = false;
  bool _showKeyboard = false;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      /// AVATAR
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [BoxShadow(
                color: colorScheme.surfaceContainerLowest,
                blurRadius: 0.0,
                spreadRadius: 0.0,
                offset: const Offset(0, 2),
              )],
            ),
          ),
          Hero(
            tag: widget.avatar,
            child: GestureDetector(
              onTap: () {
                Get.to(() => ImageViewer(img: widget.avatar));
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.avatar)
              ),
            ),
          )
        ],
      ),

      /// PROFILE INFORMATION
      Container(
        color: colorScheme.surface,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: spacingUnit(3)),
        child: Form(
          key: _editBusinessKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const VSpace(),
            AppTextField(
              label: 'Business Name',
              initialValue: widget.name,
              onChanged: (_) {},
              validator: FormBuilderValidators.required(),
              errorText: _isNotValid ? 'Please fill business name' : null,
              focusCallback: () {
                setState(() {
                  _showKeyboard = true;
                });
              },
              blurCallback: () {
                setState(() {
                  _showKeyboard = false;
                });
              },
            ),
            const VSpace(),
            AppTextField(
              label: 'Address',
              initialValue: widget.address,
              onChanged: (_) {},
              validator: FormBuilderValidators.required(),
              errorText: _isNotValid ? 'Please fill business address' : null,
              focusCallback: () {
                setState(() {
                  _showKeyboard = true;
                });
              },
              blurCallback: () {
                setState(() {
                  _showKeyboard = false;
                });
              },
            ),
            const VSpace(),
            Row(children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('CANCEL'.toUpperCase(), style: ThemeText.subtitle,)
                  ),
                ),
              ),
              SizedBox(width: spacingUnit(1),),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: FilledButton(
                    onPressed: () {
                      if (_editBusinessKey.currentState!.validate()) {
                        Get.back();
                      } else {
                        setState(() {
                          _isNotValid = true;
                        });
                      }
                    },
                    style: ThemeButton.btnBig.merge(ThemeButton.primary),
                    child: Text('UPDATE'.toUpperCase(), style: ThemeText.subtitle,)
                  ),
                ),
              ),
            ]),
            const VSpaceBig(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: _showKeyboard ? 300 : 0,
            )
          ]),
        ),
      ),
    ]);
  }
}