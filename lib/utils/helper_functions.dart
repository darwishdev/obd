import 'package:intl/intl.dart';

class HelperFunctions {
  static String formatDate(String? date) {
    return date == null
        ? ''
        : DateFormat('MMMM dd yyyy').add_Hm().format(DateTime.parse(date));
  }

  static List<String> splitByIndex(String input, int index) {
    List<String> substrings = [];

    for (int i = 0; i < input.length; i += index) {
      final endIndex = (i + index <= input.length) ? i + index : input.length;
      substrings.add(input.substring(i, endIndex));
    }

    return substrings;
  }
}
