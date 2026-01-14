import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtils {

  static Future<void> launchUrlID({required String urlID}) async{
    final Uri url = Uri.parse(
        urlID);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

}