import 'package:flutter/material.dart';

class TimePickerOptions {
  final double height;
  final Color? fontColor;
  final double fontOpacity;
  final double itemExtent;
  final double diameterRatio;
  final double numberSize;
  final double labelSize;
  final double wheelWidth;
  final double amPmSize;
  final double amPmWidth;
  final double selectedRowHeight;
  final Color? selectedRowBackgroundColor;
  final Color? selectedRowForegroundColor;
  final double selectedRowHorizontalPadding;
  final double selectedRowHorizontalBorderRadius;

  TimePickerOptions({
    required this.height,
    required this.fontColor,
    required this.fontOpacity,
    required this.itemExtent,
    required this.diameterRatio,
    required this.numberSize,
    required this.labelSize,
    required this.wheelWidth,
    required this.amPmSize,
    required this.amPmWidth,
    required this.selectedRowHeight,
    required this.selectedRowBackgroundColor,
    required this.selectedRowForegroundColor,
    required this.selectedRowHorizontalPadding,
    required this.selectedRowHorizontalBorderRadius,
  });

  TimePickerOptions.byDefault({
    double? height,
    this.fontColor,
    double? fontOpacity,
    double? itemExtent,
    double? diameterRatio,
    double? numberSize,
    double? labelSize,
    double? wheelWidth,
    double? amPmSize,
    double? amPmWidth,
    double? selectedRowHeight,
    this.selectedRowBackgroundColor,
    this.selectedRowForegroundColor,
    double? selectedRowHorizontalPadding,
    double? selectedRowHorizontalBorderRadius,
  })  : height = height ?? 90,
        fontOpacity = fontOpacity ?? 0.5,
        itemExtent = itemExtent ?? 30,
        diameterRatio = diameterRatio ?? 2,
        numberSize = numberSize ?? 25,
        labelSize = labelSize ?? 15,
        wheelWidth = wheelWidth ?? 15,
        amPmSize = amPmSize ?? 20,
        amPmWidth = amPmWidth ?? 35,
        selectedRowHeight = selectedRowHeight ?? 30,
        selectedRowHorizontalPadding = selectedRowHorizontalPadding ?? 16,
        selectedRowHorizontalBorderRadius =
            selectedRowHorizontalBorderRadius ?? 15;
}
