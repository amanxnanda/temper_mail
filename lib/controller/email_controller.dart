import 'package:get/get.dart';
import 'package:temper_mail/models/email_model.dart';

class EmailController extends GetxController {
  final Rx<EmailModel> emailModel = EmailModel().obs;

  updateEmail(String email) {
    emailModel.update((value) {
      value.email = email;
    });
  }
}
