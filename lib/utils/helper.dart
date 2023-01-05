
import 'package:url_launcher/url_launcher.dart';

class Helper{

  Future<void> launchUrlSite(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}