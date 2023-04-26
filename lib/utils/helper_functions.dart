import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';

class HelperFunctions {
  static String formatDate(String? date) {
    return date == null
        ? ''
        : DateFormat('MMMM dd yyyy').add_Hm().format(DateTime.parse(date));
  }
}
