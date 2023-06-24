import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'export.dart';

class HourPicker extends StatelessWidget {
  const HourPicker(this.options, {super.key});

  final TimePickerOptions options;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    var formatter = DateFormat('h');

    late final hour = int.parse(formatter.format(now));

    final items = List.generate(12, (index) => index + 1);

    final indexOfHour = items.indexOf(hour);

    return IntLabelWheel(
      items: items,
      label: 'Hour',
      options: options,
      controller: FixedExtentScrollController(initialItem: indexOfHour),
    );
  }
}
