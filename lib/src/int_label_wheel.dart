import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spaces2/spaces2.dart';

import 'export.dart';

class IntLabelWheel extends StatefulWidget {
  const IntLabelWheel({
    super.key,
    required this.label,
    required this.items,
    required this.onChange,
    required this.controller,
  });

  final String label;
  final List<int> items;
  final Function(int value) onChange;
  final FixedExtentScrollController controller;

  @override
  State<IntLabelWheel> createState() => _IntLabelWheelState();
}

class _IntLabelWheelState extends State<IntLabelWheel> {
  late int _selectedIndex = widget.controller.initialItem;

  late TimePickerOptions options = context.read<TimePickerOptions>();

  late final colorUtil = ColorUtil(context);

  @override
  Widget build(BuildContext context) {
    return SpacedRow.small(
      mainAxisSize: MainAxisSize.min,
      children: [
        wheel(),
        label(),
      ],
    );
  }

  Widget wheel() {
    return SizedBox(
      width: options.wheelWidth,
      child: ListWheelScrollView.useDelegate(
        controller: widget.controller,
        itemExtent: options.itemExtent,
        physics: const FixedExtentScrollPhysics(),
        diameterRatio: options.diameterRatio,
        overAndUnderCenterOpacity: options.fontOpacity,
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedIndex = index;

            final value = widget.items[index];

            widget.onChange(value);
          });
        },
        childDelegate: ListWheelChildLoopingListDelegate(
          children: widget.items.map(
            (e) {
              final index = widget.items.indexOf(e);

              final text = e.toString().padLeft(2, '0');

              final color = index == _selectedIndex
                  ? colorUtil.selectedColor
                  : colorUtil.nonSelectedColor;

              return Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontSize: options.numberSize,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  Widget label() {
    return Text(
      widget.label,
      style: TextStyle(
        fontSize: options.labelSize,
        color: colorUtil.selectedColor,
      ),
    );
  }
}
