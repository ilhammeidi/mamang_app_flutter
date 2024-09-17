import 'package:mamang_app_flutter/models/list_item.dart';
import 'package:mamang_app_flutter/widgets/input/app_bottom_picker.dart';
import 'package:flutter/material.dart';

Future openRadioPicker({
  required BuildContext context,
  required List<ListItem> options,
  required String title,
  String? initialValue,
  required Function(String?) onSelected,
}) async {
  var selectedOption = await showModalBottomSheet<String>(
    context: context,
    barrierColor: Colors.black.withOpacity(0.3),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return BottomPickerRadio(
        title: title,
        initialValue: initialValue,
        options: options,
      );
    },
  );
  onSelected(selectedOption);
}