import 'package:intl/intl.dart';

extension TimeFormat on DateTime {
  String? timeFormat() {
    var out = 'P';
    try {
      if (this.hour < 13) {
        out = 'A';
      }
      return new DateFormat('h:mm$out').format(this);
    } catch (e) {
      return null;
    }
  }
}

extension DateIosFormat on DateTime {
  String? dateIosFormat() {
    try {
      return new DateFormat('EEE MMM d').format(this);
    } catch (e) {
      return null;
    }
  }

  String? timeFormat2() {
    var out = 'P';
    try {
      if (this.hour < 13) {
        out = 'A';
      }
      return new DateFormat('h:mm$out').format(this);
    } catch (e) {
      return null;
    }
  }
}
