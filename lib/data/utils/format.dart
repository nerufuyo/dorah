import 'package:intl/intl.dart';

String formatDate(String dateString) {
  final inputFormat = DateFormat('yyyy-MM-dd');
  final outputFormat = DateFormat('d MMMM yyyy', 'en_US');

  final date = inputFormat.parse(dateString);
  return outputFormat.format(date);
}
