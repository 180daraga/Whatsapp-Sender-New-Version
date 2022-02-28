import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

double sidePadding = 15.0;
void openWhatsapp(String msg, String number, context) async {
  var link = WhatsAppUnilink(phoneNumber: "+20$number", text: msg);
  await launch("$link");
}
