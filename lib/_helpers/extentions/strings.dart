import 'datetime.dart';

extension StringExtentions on String {
  String bare() => replaceAll(RegExp('[^A-Za-z0-9]'), '-');
  String cap() => length > 1 ? '${this[0].toUpperCase()}${substring(1)}' : toUpperCase();
  String fewWords() => (length > 30 ? '${substring(0, 30)}...' : this);
  String naked() => replaceAll(RegExp('[^A-Za-z0-9]'), '_');
  String cash() => 'Ksh. $this';
  bool isValid() => trim().isNotEmpty;

  String datePart() => DateTime.parse(this).part();
  String timePart() => split(' ')[1];
}
