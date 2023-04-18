import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';

class HelperFunctions {
  static String formatDate(String? date) {
    return date == null
        ? ''
        : DateFormat('yyyy/MM/dd').format(DateTime.parse(date));
  }
}
