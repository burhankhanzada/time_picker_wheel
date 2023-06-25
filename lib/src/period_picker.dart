import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'export.dart';

class PeriodPicker extends StatefulWidget {
  const PeriodPicker({super.key});

  @override
  State<PeriodPicker> createState() => _PeriodPickerState();
}

class _PeriodPickerState extends State<PeriodPicker> {
  late TimePickerOptions options = context.read<TimePickerOptions>();

  late final colorUtil = ColorUtil(context);

  final _items = ['AM', 'PM'];

  late final timeChangeNotifier = context.watch<TimeChangeNotifier>();

  String get period => timeChangeNotifier.period;

  late final _initialItem = period == 'AM' ? 0 : 1;

  late int _selectedIndex = _initialItem;

  @override
  Widget build(BuildContext context) {
    // log('AM/PM: $period');

    return SizedBox(
      width: options.amPmWidth,
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListWheelScrollView.useDelegate(
          itemExtent: options.itemExtent,
          physics: const FixedExtentScrollPhysics(),
          diameterRatio: options.diameterRatio,
          overAndUnderCenterOpacity: options.fontOpacity,
          controller: FixedExtentScrollController(initialItem: _initialItem),
          onSelectedItemChanged: (value) {
            setState(() {
              _selectedIndex = value;
              timeChangeNotifier.period = _items[value];
              context.read<OnChange>().call(timeChangeNotifier.timeOfDay());
            });
          },
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: _items.length,
            builder: (context, index) {
              final item = _items[index];

              final color = index == _selectedIndex
                  ? colorUtil.selectedColor
                  : colorUtil.nonSelectedColor;

              return Center(
                child: Text(
                  item,
                  style: TextStyle(
                    color: color,
                    fontSize: options.amPmSize,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
