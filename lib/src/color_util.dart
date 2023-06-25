import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'export.dart';

class ColorUtil {
  final BuildContext context;
  late TimePickerOptions options = context.read<TimePickerOptions>();

  ColorUtil(this.context);

  Color get selectedColor {
    Color color = Theme.of(context).colorScheme.onPrimary;

    if (options.selectedRowForegroundColor != null) {
      color = options.selectedRowForegroundColor!;
    }

    return color;
  }

  Color get nonSelectedColor {
    Color color = Theme.of(context).colorScheme.onSurface;

    if (options.fontColor != null) {
      color = options.fontColor!;
    }

    return color;
  }
}
