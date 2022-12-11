import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {

  static Future<void> openWebsite(String url) async {
      var uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
  }

  static Future<void> openMail(String email) async {
      var uri = Uri.parse("mailto:${email}");
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch email application';
      }
  }
}