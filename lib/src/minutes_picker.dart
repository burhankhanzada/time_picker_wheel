import 'package:flutter/material.dart';

import 'export.dart';

class MinutesPicker extends StatelessWidget {
  const MinutesPicker(this.options, {super.key});

  final TimePickerOptions options;

  @override
  Widget build(BuildContext context) {
    late final minutes = DateTime.now().minute;

    final items = List.generate(60, (index) => index + 1);

    final indexOfMinutes = items.indexOf(minutes);

    return IntLabelWheel(
      items: items,
      label: 'Minutes',
      options: options,
      controller: FixedExtentScrollController(initialItem: indexOfMinutes),
    );
  }
}
