import 'package:url_launcher/url_launcher.dart';

Future<void> launchPhoneDialer(String contactNumber) async {
  final Uri phoneUri = Uri(scheme: "tel", path: contactNumber);
  try {
    if (await canLaunchUrl(phoneUri)) await launchUrl(phoneUri);
  } catch (error) {
    throw ("Cannot dial");
  }
}

Future<void> launchGoogleSearch(String code) async {
  final Uri uri = Uri(
      scheme: "https",
      host: 'google.com',
      path: 'search',
      query: "q=$code+fault++code");

  try {
    await launchUrl(uri);
  } catch (error) {
    throw ("Cannot dial");
  }
}
