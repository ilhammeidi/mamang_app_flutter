import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mamang_app_flutter/ui/themes/theme_button.dart';
import 'package:mamang_app_flutter/ui/themes/theme_radius.dart';
import 'package:mamang_app_flutter/ui/themes/theme_spacing.dart';
import 'package:mamang_app_flutter/ui/themes/theme_text.dart';
import 'package:mamang_app_flutter/ui/utils/grabber_icon.dart';
import 'package:mamang_app_flutter/ui/widgets/app_input/app_textfield.dart';

class FilterDate extends StatefulWidget {
  const FilterDate({super.key});

  @override
  State<FilterDate> createState() => _FilterDateState();
}

class _FilterDateState extends State<FilterDate> {
  String _tagFilter = 'All Time';
  final List _shortFilter = <String>['All Time', 'Last Week', 'Last 14 Days', 'Last 21 Days', 'Last Month', 'Last 2 Month', 'Last 3 Month'];

  void setTag(val) {
    setState(() {
      _tagFilter = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    ButtonStyle buttonStyle = ThemeButton.btnSmall.merge(ThemeButton.tonalDefault(context));
    ButtonStyle selectedStyle = ThemeButton.btnSmall.merge(ThemeButton.invert(context));

    return Column(children: [
      /// FILTER DATE
      InkWell(
        onTap: () {
          showModalBottomSheet<dynamic>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return const Wrap(children: [
                SettingDatePicker()
              ]);
            }
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: spacingUnit(1)),
          decoration: BoxDecoration(
            borderRadius: ThemeRadius.medium,
            color: colorScheme.outline.withOpacity(0.5)
          ),
          child: Row(children: [
            SizedBox(
              width: 180,
              child: ListTile(
                leading: Icon(Icons.calendar_month, color: colorScheme.onSecondaryContainer, size: 22),
                title: Text('Date from', style: ThemeText.caption.copyWith(color: colorScheme.onSurfaceVariant)),
                subtitle: Text('22 May 2024', style: ThemeText.paragraph.copyWith(color: colorScheme.onSurface)),
              ),
            ),
            Expanded(child: Container(alignment: Alignment.center, child: const Text('-', style: ThemeText.subtitle2,))),
            SizedBox(
              width: 180,
              child: ListTile(
                leading: Icon(Icons.calendar_month, color: colorScheme.onSecondaryContainer, size: 22),
                title: Text('Date to', style: ThemeText.caption.copyWith(color: colorScheme.onSurfaceVariant)),
                subtitle: Text('30 May 2024', style: ThemeText.paragraph.copyWith(color: colorScheme.onSurface)),
              ),
            ),
          ]),
        ),
      ),

      const SizedBox(height: 8),

      /// FILTER TAGS
      SizedBox(
        height: 24,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: _shortFilter.asMap().entries.map((entry) {
            String item = entry.value;
            int index = entry.key;

            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? spacingUnit(1) : 0, right: spacingUnit(1)),
              child: FilledButton(
                onPressed: () {
                  setTag(item);
                },
                style: _tagFilter == item ? selectedStyle : buttonStyle,
                child: Text(item, style: ThemeText.caption)
              ),
            );
          }).toList()
        ),
      )
    ]);
  }
}

class SettingDatePicker extends StatefulWidget {
  const SettingDatePicker({super.key});

  @override
  State<SettingDatePicker> createState() => _SettingDatePickerState();
}

class _SettingDatePickerState extends State<SettingDatePicker> {
  final TextEditingController _dateFrom = TextEditingController();
  final TextEditingController _dateTo = TextEditingController();

  Future<void> _selectDate(isFrom) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      if(isFrom) {
        setState(() {
          _dateFrom.text = picked.toString().split(" ")[0];
        });
      } else {
        _dateTo.text = picked.toString().split(" ")[0];
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingUnit(2)),
      child: Column(children: [
        const GrabberIcon(),
        const VSpace(),
        /// Title
        Padding(
          padding: EdgeInsets.only(
            bottom: spacingUnit(2),
          ),
          child: Text('Select Date Range', textAlign: TextAlign.center, style: ThemeText.title2.copyWith(fontWeight: FontWeight.bold)),
        ),
        const VSpaceShort(),
      
        /// FORMS
        const VSpaceShort(),
        AppTextField(
          controller: _dateFrom,
          readOnly: true,
          label: 'Date From',
          prefixIcon: Icons.date_range,
          onChanged: (_) {},
          onTap: () {
            _selectDate(true);
          },
        ),
        const VSpaceShort(),
        AppTextField(
          controller: _dateTo,
          readOnly: true,
          label: 'Date To',
          prefixIcon: Icons.date_range,
          onChanged: (_) {},
          onTap: () {
            _selectDate(false);
          },
        ),
        const VSpaceShort(),
        
        /// ACTION BUTTONS
        Row(children: [
          Expanded(
            flex: 1,
            child: OutlinedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Discard'),
            ),
          ),
          SizedBox(width: spacingUnit(1)),
          Expanded(
            flex: 1,
            child: FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ThemeButton.primary,
              child: const Text('Update'),
            ),
          )
        ]),
        const VSpaceBig()
      ]),
    );
  }
}