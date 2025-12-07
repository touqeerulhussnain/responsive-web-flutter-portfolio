import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '/core/constants/app_constant.dart';
import 'dprint.dart';

class Helper {
  Helper._();

  static Future<void> supportEmail() async {
    const String supportEmail = "touqeerulhussnain@gmail.com";

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: supportEmail,
      queryParameters: {'subject': 'Portfolio response', 'body': 'Hi,...'},
    );

    dprint("Launching: $emailUri");

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } else {
      dprint('Could not launch $emailUri');
    }
  }

  static Future<void> launchUrlInBrowser(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

}
