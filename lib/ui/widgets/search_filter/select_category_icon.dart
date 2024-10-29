import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/models/category.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_shadow.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class SelectCategoryIcon extends StatefulWidget {
  const SelectCategoryIcon({super.key, required this.items});

  final List items;

  @override
  State<SelectCategoryIcon> createState() => _SelectCategoryIconState();
}

class _SelectCategoryIconState extends State<SelectCategoryIcon> {
  List _selectedTag = <String>['food', 'services', 'automotive', 'property', 'education', 'sport', 'holiday', 'souvenir'];
  
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () {
        _dialogBuilder(context, _selectedTag);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 12),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: ThemeRadius.medium,
          color: colorScheme.surface,
          boxShadow: [ThemeShade.shadeMedium(context)]
        ),
        child: Row(children: [
          Text('Categories:', style: ThemeText.caption.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(width: 8),
          Row(
            children: widget.items.map((item) => Align(
              widthFactor: 0.8,
              child: _selectedTag.contains(item.id) ? CircleAvatar(
                radius: 12,
                backgroundColor: lighten(item.color, 0.5),
                child: Icon(item.icon!, size: 16, color: item.color!,),
              ) : Container(),
            )).toList()
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_drop_down_rounded)
        ])
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, List tags) {
    List tagList = tags;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Choose Category', textAlign: TextAlign.center,),
              contentPadding: EdgeInsets.all(spacingUnit(1)),
              content: SizedBox(
                height: 190,
                width: 500,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.all(spacingUnit(1)),
                  itemCount: categoryList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: 4,
                  ),
                  itemBuilder: (context, index) {
                    Category item = categoryList[index];
                    return InkWell(
                      onTap: () {
                        if(tagList.contains(item.id)) {
                          setState(() {
                            tagList.remove(item.id);
                          });
                        } else {
                          setState(() {
                            tagList.add(item.id);
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: ThemeRadius.small,
                          color: item.color.withOpacity(0.15)
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(spacingUnit(1)),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                            Icon(item.icon, color: item.color, size: 14),
                            const SizedBox(width: 4),
                            Text(item.name, style: ThemeText.caption.copyWith(fontWeight: FontWeight.w700, color: item.color)),
                            const Spacer(),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Checkbox(value: tagList.contains(item.id), onChanged: (_) {}, activeColor: item.color)
                              )
                            )
                          ]),
                        ),          
                      ),
                    );
                  },
                ),
              ),
              actions: [
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context, tagList);
                    },
                    style: ThemeButton.tonalPrimary(context),
                    child: const Text('Update')
                  ),
                )
              ],
            );
          },
        );
      }
    ).then((value) {
      if (value != null) {
        setState(() {
          _selectedTag = value;
        });
      }
    });
  }
}