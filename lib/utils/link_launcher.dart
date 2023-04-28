import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class LinkLauncher {
  static Future<void> makeCall(String? phoneNumber) async {
    if (phoneNumber == null) return;
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    if (!await launchUrl(phoneLaunchUri)) throw 'Could not launch phone';
  }

  static Future<void> launchGoogleSearch(String? search) async {
    if (search == null || search.isEmpty) return;

    final Uri launchUri = Uri(
      scheme: "https",
      host: 'google.com',
      path: 'search',
      query: "q=$search+fault+code",
    );

    if (!await launchUrl(launchUri)) throw 'Could not launch link';
  }

  static Future<void> launchMap(double? lat, double? lng) async {
    if (lat == null || lng == null) return;
    late Uri url;
    late Uri urlAppleMaps;
    if (Platform.isAndroid) {
      url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$lat,$lng',
      );
    } else if (Platform.isIOS) {
      urlAppleMaps = Uri.parse('https://maps.apple.com/?q=$lat,$lng');
      url = Uri.parse(
        'comgooglemaps://?saddr=&daddr=$lat,$lng&directionsmode=driving',
      );
    } else {
      throw 'Unsupported platform';
    }

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else if (await canLaunchUrl(urlAppleMaps)) {
      await launchUrl(urlAppleMaps);
    } else {
      throw 'Could not launch $url';
    }
  }
}
