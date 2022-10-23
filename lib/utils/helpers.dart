import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> launchPhoneDialer(String contactNumber) async {
  final Uri _phoneUri = Uri(scheme: "tel", path: contactNumber);
  try {
    if (await canLaunchUrl(_phoneUri)) await launchUrl(_phoneUri);
  } catch (error) {
    throw ("Cannot dial");
  }
}

Future<void> launchGoogleSearch(String code) async {
  final Uri _uri = Uri(
      scheme: "https",
      host: 'google.com',
      path: 'search',
      query: "q=${code}+fault++code");

  try {
    await launchUrl(_uri);
  } catch (error) {
    throw ("Cannot dial");
  }
}
