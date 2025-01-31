
import 'package:url_launcher/url_launcher.dart';

Future<void> LaunchUs(String _url) async {
  if (!await launchUrl(
    Uri.parse(_url),
    mode: LaunchMode.externalApplication
    )) {
    throw Exception('Could not launch $_url');
  }
}