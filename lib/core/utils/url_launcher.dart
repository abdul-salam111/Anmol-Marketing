import 'package:url_launcher/url_launcher.dart';

void launchCaller(String phoneNumber) async {
  var url = Uri.parse("tel:$phoneNumber");
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
