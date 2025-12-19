import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spaces2/spaces2.dart';
import 'package:time_picker_wheel/src/time_picker_widget.dart';

import 'export.dart';

typedef OnChange = void Function(TimeOfDay timeOfDay);

class TimePicker extends StatelessWidget {
  const TimePicker({
    super.key,
    this.options,
    required this.onChange,
  });

  final TimePickerOptions? options;

  final OnChange onChange;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => options ?? TimePickerOptions.byDefault(),
        ),
        Provider(
          create: (context) => onChange,
        ),
        ChangeNotifierProvider(
          create: (context) {
            return TimeChangeNotifier();
          },
        ),
      ],
      builder: (context, child) {
        return Spacing.fixed(
          data: SpacingData.generate(16),
          child: const TimePickerWidget(),
        );
      },
    );
  }
}
