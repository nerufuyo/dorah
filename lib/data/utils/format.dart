import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

String formatDate(String dateString) {
  final inputFormat = DateFormat('yyyy-MM-dd');
  final outputFormat = DateFormat('d MMMM yyyy', 'en_US');

  final date = inputFormat.parse(dateString);
  return outputFormat.format(date);
}

String formatTimeAgo(String dateString) {
  final parsedDate = DateTime.parse(dateString);
  final now = DateTime.now();

  final difference = now.difference(parsedDate);
  final differenceInMinutes = difference.inMinutes;

  final formattedTimeAgo = timeago.format(
    now.subtract(Duration(minutes: differenceInMinutes)),
    locale: 'en',
  );

  return formattedTimeAgo;
}
