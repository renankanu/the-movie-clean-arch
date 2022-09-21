import 'package:intl/intl.dart';

extension StringExtension on String {
  String toDate() {
    final formatLocale = DateFormat('dd/MM/yyyy', 'en');
    return formatLocale.format(DateTime.parse(this));
  }
}
