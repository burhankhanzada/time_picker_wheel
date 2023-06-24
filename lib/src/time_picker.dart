import 'package:flutter/material.dart';
import 'package:spaces2/spaces2.dart';

import 'export.dart';

class TimePicker extends StatefulWidget {
  TimePicker({super.key, TimePickerOptions? options})
      : options = options ?? TimePickerOptions.byDefault();

  final TimePickerOptions options;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  final rowKey = GlobalKey();

  double _containerWidth = double.maxFinite;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final context = rowKey.currentContext;

      if (context == null) return;

      final rowSize = context.size!.width;

      setState(() {
        _containerWidth = rowSize;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Spacing.fixed(
      data: SpacingData.generate(16),
      child: timePicker(context),
    );
  }

  Widget timePicker(BuildContext context) {
    return SizedBox(
      height: widget.options.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          selectedRow(context),
          SpacedRow(
            key: rowKey,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HourPicker(widget.options),
              MinutesPicker(widget.options),
              AMPMPicker(widget.options),
            ],
          ),
        ],
      ),
    );
  }

  Widget selectedRow(BuildContext context) {
    final width = _containerWidth + widget.options.selectedRowHorizontalPadding;

    return Container(
      width: width,
      height: widget.options.selectedRowHeight,
      decoration: BoxDecoration(
        color: widget.options.selectedRowBackgroundColor ??
            Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(
          widget.options.selectedRowHorizontalBorderRadius,
        ),
      ),
    );
  }
}
