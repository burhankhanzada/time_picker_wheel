import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'export.dart';

class MinutesPicker extends StatelessWidget {
  const MinutesPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(60, (index) => index);

    final timeChangeNotifier = context.watch<TimeChangeNotifier>();

    final minutes = timeChangeNotifier.minutes;

    // log('Minutes: $minutes');

    final indexOfMinutes = items.indexOf(minutes);

    return IntLabelWheel(
      items: items,
      label: 'Minutes',
      onChange: (value) {
        timeChangeNotifier.minutes = value;
        context.read<OnChange>().call(timeChangeNotifier.timeOfDay());
      },
      controller: FixedExtentScrollController(initialItem: indexOfMinutes),
    );
  }
}
