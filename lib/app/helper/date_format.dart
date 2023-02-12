import 'package:intl/intl.dart';

formatDate(date) {
  DateTime now = DateTime.parse(date);
  var formatter = DateFormat('yyyy/MM/dd');
  var formatted = formatter.format(now);
  return formatted;
}
