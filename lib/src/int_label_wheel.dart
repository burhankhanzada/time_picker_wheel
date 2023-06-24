import 'package:flutter/material.dart';
import 'package:spaces2/spaces2.dart';

import 'export.dart';

class IntLabelWheel extends StatefulWidget {
  const IntLabelWheel({
    super.key,
    required this.items,
    required this.label,
    required this.controller,
    required this.options,
  });

  final List<int> items;
  final String label;
  final FixedExtentScrollController controller;

  final TimePickerOptions options;

  @override
  State<IntLabelWheel> createState() => _IntLabelWheelState();
}

class _IntLabelWheelState extends State<IntLabelWheel> {
  late int _selectedIndex = widget.controller.initialItem;

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

    return SpacedRow.small(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: widget.options.wheelWidth,
          child: ListWheelScrollView.useDelegate(
            controller: widget.controller,
            itemExtent: widget.options.itemExtent,
            physics: const FixedExtentScrollPhysics(),
            diameterRatio: widget.options.diameterRatio,
            overAndUnderCenterOpacity: widget.options.fontOpacity,
            onSelectedItemChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            childDelegate: ListWheelChildLoopingListDelegate(
              children: widget.items.map(
                (e) {
                  final index = widget.items.indexOf(e);

                  final text = e.toString();

                  final color = index == _selectedIndex
                      ? seletectColor
                      : nonSeletectColor;

                  return Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: widget.options.numberSize,
                        color: color,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
        Text(
          widget.label,
          style: TextStyle(
            fontSize: widget.options.labelSize,
            color: seletectColor,
          ),
        )
      ],
    );
  }
}
