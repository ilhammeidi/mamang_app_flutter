import 'package:flutter/material.dart';
import 'package:mamang_app_flutter/utils/picker.dart';
import 'package:mamang_app_flutter/models/list_item.dart';
import 'package:mamang_app_flutter/widgets/input/app_textfield.dart';
import 'package:mamang_app_flutter/ui/theme_spacing.dart';

final List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class SampleForm extends StatefulWidget {
  const SampleForm({super.key});

  @override
  State<SampleForm> createState() => _SampleFormState();
}

class _SampleFormState extends State<SampleForm> {
  final TextEditingController _dateFromRef = TextEditingController(text: '1/1/2024');
  final TextEditingController _dateToRef = TextEditingController();
  final TextEditingController _timePickerRef = TextEditingController();

  String? hobby;
  final TextEditingController _chooseRef = TextEditingController();

  List<ListItem> hobbyOptions = [
    ListItem(
      value: 'M',
      label: 'Music',
      text: 'Music description',
    ),
    ListItem(
      value: 'F',
      label: 'Film',
      text: 'Film description',
    ),
    ListItem(
      value: 'O',
      label: 'Other',
      text: 'Other description',
    ),
  ];

  void openPicker(BuildContext context) {
    openRadioPicker(
      context: context,
      options: hobbyOptions,
      title: 'Choose Hobby',
      onSelected: (value) {
        if (value != null) {
          String result = hobbyOptions.firstWhere((e) => e.value == value).label;
          _chooseRef.text = result;
        }
        setState(() {
          hobby = value;
        });
      },
      // onSelected: (value) => setState(() => hobby = value),
      initialValue: hobby,
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        _dateFromRef.text = picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 7, minute: 30),
      orientation: Orientation.portrait,
      initialEntryMode: TimePickerEntryMode.dial
    );
  
    setState(() {
      _timePickerRef.text = time!.format(context);
    });
  }

  Future _selectDate2(TextEditingController targetRef) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        targetRef.text = picked.toString().split(" ")[0];
      });
    }
  } 

  String dropdownValue = list.last;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(height: 40),
            AppTextField(
              controller: _timePickerRef,
              readOnly: true,
              prefixIcon: Icons.access_time,
              label: 'Time from',
              onChanged: (_) {},
              onTap: _selectTime,
            ),
            const VSpace(),
            TextField(
              controller: _dateFromRef,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Date From',
                prefixIcon: Icon(Icons.date_range)
              ),
              onTap: () {
                _selectDate2(_dateFromRef);
              },
            ),
            const SizedBox(height: 10),
            AppTextField(
              controller: _dateToRef,
              readOnly: true,
              prefixIcon: Icons.date_range,
              label: 'Date to',
              onChanged: (_) {},
              onTap: () {
                _selectDate2(_dateToRef);
              },
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Macam Input',
              ),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            const SizedBox(height: 10),
            AppTextField(
              controller: _chooseRef,
              label: 'Choose hobby',
              onChanged: (_) {},
              onTap: () {
                openPicker(context);
              },
              suffixIcon: Icons.arrow_drop_down,
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: 'label',
                prefixIcon: Icon(Icons.date_range),
              ),
              maxLines: 4,
            ),
            const VSpaceBig(),
            SizedBox(
              height: 50,
              width: 200,
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 2,
                style: const TextStyle(color: Colors.deepPurple),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const VSpaceBig(),
            CustomTextField(
              style: const TextStyle(fontSize: 16.0),
            ),
            const VSpaceBig(),
          ]
        ),
      ),
    );
  }
}

class CustomTextField extends TextField {
  CustomTextField({
    super.key,
    super.controller,
    super.style,
  }) : super(
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.0),
      ),
    ),
  );
}