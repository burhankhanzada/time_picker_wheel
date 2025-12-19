# Time Picker

Time Picker inspired by Oppo Clock app set alram time screen with full customization

## Features

* Easy to use
* Fully customizable

## Getting started

```yaml
dependencies:
  ...

  time_picker_wheel: <version>

```

## Usage

```dart
import 'package:time_picker_wheel/time_picker_wheel.dart';
```

Defualt style

```dart
TimePicker(
    onChange: (timeOfDay) {
    },
),
```

Customize style

```dart
TimePicker(
    onChange: (timeOfDay) {
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
```

## Example

| Screenshot | Gif |
|------------|-----|
| <img src="https://i.imgur.com/CmuGuM9.png" width="200"/> | <img src="https://i.imgur.com/KqUxDUG.gif" width="200"/>
