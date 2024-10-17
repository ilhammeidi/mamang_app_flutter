import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';

class AppTextfieldFormBuilder extends StatefulWidget {
  const AppTextfieldFormBuilder({
    super.key,
    required this.label,
    required this.name,
    this.hint,
    this.errorText,
    this.initialValue,
    this.readOnly = false,
    this.maxLines = 1,
    this.controller,
    this.prefixIcon,
    this.suffix,
    this.onTap,
    this.obscureText = false,
    this.validator,
  });

  final String label;
  final String name;
  final String? hint;
  final String? errorText;
  final String? initialValue;
  final bool readOnly;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final Widget? suffix;
  final int maxLines;
  final void Function()? onTap;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  State<AppTextfieldFormBuilder> createState() => _AppTextfieldFormBuilderState();
}

class _AppTextfieldFormBuilderState extends State<AppTextfieldFormBuilder> {
  final focusNode = FocusNode();
  bool boxFocus = false;

  @override
  void initState(){
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          boxFocus = true;
        });
      } else {
        setState(() {
          boxFocus = false;
        });
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Color borderColor() {
      if (widget.errorText != null) {
        return Colors.red[400]!;
      } else {
        if (boxFocus) {
          return ThemePalette.primaryMain;
        } else {
          return Theme.of(context).colorScheme.outlineVariant;
        }
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: ThemeRadius.small,
            border: Border.all(
              width: 1,
              color: borderColor()
            )
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 4,
              bottom: 4,
              left: widget.prefixIcon != null ? 0 : spacingUnit(2),
              right: widget.suffix != null ? 0 : spacingUnit(2)
            ),
            child: FormBuilderTextField(
              key: widget.key,
              name: widget.name,
              focusNode: focusNode,
              readOnly: widget.readOnly,
              maxLines: widget.maxLines,
              obscureText: widget.maxLines == 1 ? widget.obscureText : false,
              onTap: widget.onTap,
              validator: widget.validator,
              decoration: InputDecoration(
                errorStyle: const TextStyle(fontSize: 0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                labelText: widget.label,
                alignLabelWithHint: widget.maxLines != 1 ? true : false,
                hintText: widget.hint ?? widget.hint,
                prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
                suffixIcon: widget.suffix ?? widget.suffix
              ),
            ),
          ),
        ),
        widget.errorText != null ?
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 16),
            child: Text(widget.errorText!, style: ThemeText.caption.copyWith(color: Colors.red[400]),)
          ) : Container()
      ],
    );
  }
}