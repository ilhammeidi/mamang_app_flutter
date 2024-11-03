import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';

class LocationForm extends StatefulWidget {
  const LocationForm({super.key});

  @override
  State<LocationForm> createState() => _LocationFormState();
}

class _LocationFormState extends State<LocationForm> {
  final _inputLocationRef = TextEditingController();
  final _location = 'Jl. Bengawan No.34, Cihapit, Kec. Bandung Wetan, Kota Bandung, Jawa Barat 40114';
  
  bool _isEdit = false;

  @override
  void dispose() {
    _inputLocationRef.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _inputLocationRef.text = _location;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(children: [
      const Text('Please set your current location', textAlign: TextAlign.center, style: ThemeText.subtitle),
      const VSpaceShort(),
      ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            padding: EdgeInsets.all(spacingUnit(1)),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: ThemeRadius.small,
              border: Border.all(
                width: 1,
                color: colorScheme.outlineVariant,
              ),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              /// MAP
              Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.location_on, size: 16, color: ThemePalette.tertiaryMain),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    _location,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(fontWeight: FontWeight.w500)
                  ),
                )
              ]),
              const SizedBox(height: 4),
              ClipRRect(
                borderRadius: ThemeRadius.small,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/map_landscape_with_marker.png',
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.cover,
                      color: Colors.black.withOpacity(_isEdit ? 0.5 : 0),
                      colorBlendMode: BlendMode.darken,
                    ),
                    _isEdit ?
                      Positioned(
                        bottom: 4,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _isEdit = false;
                              _inputLocationRef.text = _location;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              color: ThemePalette.secondaryLight,
                              borderRadius: ThemeRadius.big,
                            ),
                            child: Text('Use This Location', style: ThemeText.caption.copyWith(color: ThemePalette.secondaryDark), textAlign: TextAlign.center,)
                          ),
                        ),
                      ) : Container()
                  ],
                )
              ),
            ])
          ),
        ],
      ),
      const VSpaceShort(),
      AppTextField(
        controller: _inputLocationRef,
        label: 'Location',
        onChanged: (_) {},
        readOnly: !_isEdit,
        suffix: _isEdit ?
          IconButton(
            onPressed: () {
              setState(() {
                _inputLocationRef.text = '';
              });
            },
            icon: const Icon(Icons.clear)
          ) : IconButton(
            onPressed: () {
              setState(() {
                _isEdit = true;
              });
            },
            icon: const Icon(Icons.edit_location_alt)
          ),
      )
    ]);
  }
}