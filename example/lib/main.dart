import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spaces2/spaces2.dart';
import 'package:time_picker_wheel/time_picker_wheel.dart';

void main() {
  runApp(
    Spacing.fixed(
      data: SpacingData.generate(16),
      child: const App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String defaultPickerTime = '';
  String customizePickerTime = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Time Picker'),
        ),
        body: SpacedColumn(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            defaultStyle(),
            customizeStyle(),
          ],
        ),
      ),
    );
  }

  Widget defaultStyle() {
    return SpacedColumn(
      children: [
        Text(
          'Default Style',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        TimePicker(
          onChange: (timeOfDay) {
            setState(() {
              defaultPickerTime = getFormatedTimeFromTimeOfDay(timeOfDay);
            });
          },
        ),
        Text(
          defaultPickerTime,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }

  Widget customizeStyle() {
    return SpacedColumn(
      children: [
        Text(
          'Customize Style',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        TimePicker(
          onChange: (timeOfDay) {
            setState(() {
              customizePickerTime = getFormatedTimeFromTimeOfDay(timeOfDay);
            });
          },
          options: TimePickerOptions.byDefault(
            height: 200,
            itemExtent: 30,
            diameterRatio: 1,
            selectedRowHeight: 70,
            fontOpacity: 1,
            fontColor: Colors.purple,
            labelSize: 25,
            numberSize: 25,
            amPmSize: 15,
            amPmWidth: 25,
            wheelWidth: 50,
            selectedRowHorizontalPadding: double.maxFinite,
            selectedRowHorizontalBorderRadius: 0,
            selectedRowForegroundColor: Colors.black,
            selectedRowBackgroundColor: Colors.amber,
          ),
        ),
        Text(
          customizePickerTime,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }

  String getFormatedTimeFromTimeOfDay(TimeOfDay timeOfDay) {
    final hour = timeOfDay.hourOfPeriod.toString().padLeft(2, '0');
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    final period = timeOfDay.period.name.toUpperCase();

    String time = '$hour:$minute $period';

    log(time);

    return time;
  }
}
