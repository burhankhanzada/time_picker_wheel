import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'export.dart';

class AMPMPicker extends StatefulWidget {
  const AMPMPicker(this.options, {super.key});

  final TimePickerOptions options;

  @override
  State<AMPMPicker> createState() => _AMPMPickerState();
}

class _AMPMPickerState extends State<AMPMPicker> {
  final _now = DateTime.now();

  late final _formattedTime = DateFormat('h:mm a').format(_now);

  final _items = ['AM', 'PM'];

  late final _initialItem = _formattedTime.contains('AM') ? 0 : 1;

  late int _selectedIndex = _initialItem;

  @override
  Widget build(BuildContext context) {
    Color seletectColor = Theme.of(context).colorScheme.onPrimary;

    if (widget.options.selectedRowForegroundColor != null) {
      seletectColor = widget.options.selectedRowForegroundColor!;
    }

    Color nonSeletectColor = Theme.of(context).colorScheme.onSurface;

    if (widget.options.fontColor != null) {
      nonSeletectColor = widget.options.fontColor!;
    }

    return SizedBox(
      width: widget.options.amPmWidth,
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListWheelScrollView.useDelegate(
          itemExtent: widget.options.itemExtent,
          physics: const FixedExtentScrollPhysics(),
          diameterRatio: widget.options.diameterRatio,
          overAndUnderCenterOpacity: widget.options.fontOpacity,
          controller: FixedExtentScrollController(initialItem: _initialItem),
          onSelectedItemChanged: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: _items.length,
            builder: (context, index) {
              final item = _items[index];

              final color =
                  index == _selectedIndex ? seletectColor : nonSeletectColor;

              return Center(
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: widget.options.amPmSize,
                    color: color,
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
