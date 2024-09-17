import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/ui/theme_palette.dart';
import 'package:mamang_app_flutter/ui/theme_spacing.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.onChanged,
    this.hint,
    this.readOnly = false,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
  });

  final String label;
  final String? hint;
  final bool readOnly;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? onTap;
  final void Function(String) onChanged;

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
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: boxFocus ? ThemePalette.primaryMain : Theme.of(context).colorScheme.outline
        )
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: spacingUnit(1),
          bottom: spacingUnit(1),
          left: widget.prefixIcon != null ? 0 : spacingUnit(2),
          right: widget.suffixIcon != null ? 0 : spacingUnit(2)
        ),
        child: TextField(
          controller: widget.controller,
          focusNode: focusNode,
          readOnly: widget.readOnly,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: widget.label,
            hintText: widget.hint ?? widget.hint,
            prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
            suffixIcon: widget.suffixIcon != null ? Icon(widget.suffixIcon) : null
          ),
          onTap: widget.onTap,
          onChanged: (String value) => widget.onChanged(value),
        ),
      ),
    );
  }
}