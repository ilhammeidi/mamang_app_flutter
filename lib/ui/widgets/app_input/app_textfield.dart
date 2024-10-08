import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/themes/theme_palette.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.onChanged,
    this.hint,
    this.readOnly = false,
    this.maxLines,
    this.controller,
    this.prefixIcon,
    this.suffix,
    this.onTap,
    this.obscureText = false
  });

  final String label;
  final String? hint;
  final bool readOnly;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final Widget? suffix;
  final int? maxLines;
  final void Function()? onTap;
  final void Function(String) onChanged;
  final bool obscureText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
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
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: ThemeRadius.small,
        border: Border.all(
          width: 1,
          color: boxFocus ? ThemePalette.primaryMain : Theme.of(context).colorScheme.outlineVariant
        )
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: widget.prefixIcon != null ? 0 : spacingUnit(2),
          right: widget.suffix != null ? 0 : spacingUnit(2)
        ),
        child: TextField(
          controller: widget.controller,
          focusNode: focusNode,
          readOnly: widget.readOnly,
          maxLines: widget.maxLines,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            labelText: widget.label,
            alignLabelWithHint: widget.maxLines != null ? true : false,
            hintText: widget.hint ?? widget.hint,
            prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
            suffixIcon: widget.suffix ?? widget.suffix
          ),
          onTap: widget.onTap,
          onChanged: (String value) => widget.onChanged(value),
        ),
      ),
    );
  }
}