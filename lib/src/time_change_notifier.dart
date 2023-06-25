import 'package:flutter/material.dart';

class TimeChangeNotifier extends ChangeNotifier {
  final now = DateTime.now();

  late int _hour = now.hour;

  int get hour => _convert24To12(_hour);

  int _convert24To12(int hour24) {
    return (hour24 > 12) ? hour24 - 12 : hour24;
  }

  set hour(int value) {
    _hour = _convert12To24(value);
    notifyListeners();
  }

  int _convert12To24(int hour12) {
    return (_period == 'PM') ? hour12 + 12 : hour12;
  }

  late int _minutes = now.minute;

  int get minutes => _minutes;

  set minutes(int value) {
    _minutes = value;
    notifyListeners();
  }

  late final String _currentPeriod = _hour >= 12 ? 'PM' : 'AM';

  late String _period = _currentPeriod;

  String get period => _period;

  set period(String value) {
    _period = value;
    adjustHourAccrodingToPeriod();
    notifyListeners();
  }

  void adjustHourAccrodingToPeriod() {
    if (_period == 'AM' && _hour > 12) {
      _hour = _hour - 12;
    } else {
      _hour = _hour + 12;
    }
  }

  TimeOfDay timeOfDay() {
    // log('Hour: $_hour, Minutes: $_minutes, AM/PM: $_period');

    return TimeOfDay(hour: _hour, minute: _minutes);
  }
}
