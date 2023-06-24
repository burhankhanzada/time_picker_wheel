import 'package:flutter/material.dart';
import 'package:spaces2/spaces2.dart';
import 'package:time_picker_wheel/time_picker_wheel.dart';

void main() {
  runApp(
    Spacing.fixed(
      data: SpacingData.generate(16),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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
    return SpacedColumn.small(
      children: [
        Text(
          'Default Style',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        TimePicker(),
      ],
    );
  }

  Widget customizeStyle() {
    return SpacedColumn.small(
      children: [
        Text(
          'Customize Style',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        TimePicker(
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
        )
      ],
    );
  }
}
