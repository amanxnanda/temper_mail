import 'package:get/get.dart';
import 'package:temper_mail/models/email_model.dart';

class EmailController extends GetxController {
  final Rx<Email> email = Email().obs;

  updateEmail(String username, String domain) {
    email.update((val) {
      val.username = username;
      val.domain = domain;
    });
  }
}
