import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spaces2/spaces2.dart';

import 'export.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  late TimePickerOptions options;

  final rowKey = GlobalKey();

  double _containerWidth = double.maxFinite;

  bool firstCall = false;

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

      if (firstCall == false) {
        final timeChangeNotifier = context.read<TimeChangeNotifier>();
        context.read<OnChange>().call(timeChangeNotifier.timeOfDay());
        firstCall = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    options = context.read<TimePickerOptions>();

    return SizedBox(
      height: options.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          selectedRow(context),
          wheel(),
        ],
      ),
    );
  }

  Widget wheel() {
    return SpacedRow(
      key: rowKey,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        HourPicker(),
        MinutesPicker(),
        PeriodPicker(),
      ],
    );
  }

  Widget selectedRow(BuildContext context) {
    final width = _containerWidth + options.selectedRowHorizontalPadding;

    return Container(
      width: width,
      height: options.selectedRowHeight,
      decoration: BoxDecoration(
        color: options.selectedRowBackgroundColor ??
            Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(
          options.selectedRowHorizontalBorderRadius,
        ),
      ),
    );
  }
}
