import 'package:intl/intl.dart';

class HelperFunctions {
  static String formatDate(String? date) {
    return date == null
        ? ''
        : DateFormat('MMMM dd yyyy').add_Hm().format(DateTime.parse(date));
  }
}
