class RegexConstants {
  static final kEmailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final kNumberRegex = RegExp(r'[\u0660-\u06690-9]');
  static final kPasswordRegex =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,20}$');
  static final kArabicRegex =
      RegExp(r'[\u0621-\u064A0-9]|[\u0621-\u064A\u0660-\u0669]', unicode: true);
}
