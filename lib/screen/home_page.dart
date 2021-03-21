import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:temper_mail/controller/email_controller.dart';
import 'package:temper_mail/models/generated_emails.dart';
import 'package:temper_mail/screen/components/mail_box.dart';
import 'package:temper_mail/services/api_response.dart';
import 'package:temper_mail/services/services.dart';

class HomePage extends StatelessWidget {
  final EmailController emailController = Get.put(EmailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Center(
          child: Text(
            'Fake Mail Generator',
            style: TextStyle(
              color: Colors.amber[300],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Image.asset('assets/img.png')),
          Card(
            elevation: 5.0,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(emailController.emailModel.value.email),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton.icon(
                onPressed: () async {
                  ApiResponse res = await Services().getMail();

                  String finalEmail = generatedEmailModelFromJson(res.data)[0];
                  emailController.updateEmail(finalEmail);
                },
                icon: Icon(Icons.autorenew),
                label: Text('Refresh'),
                style: OutlinedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: Colors.amber[300],
                  padding: EdgeInsets.all(20),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Clipboard.setData(new ClipboardData(text: emailController.emailModel.value.email))
                      .then(
                    (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Copied to clipboard...'),
                        ),
                      );
                    },
                  );
                },
                icon: Icon(FontAwesomeIcons.copy),
                label: Text('Clipboard'),
                style: OutlinedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: Colors.amber[300],
                  padding: EdgeInsets.all(20),
                ),
              ),
            ],
          ),
          MailBox(),
        ],
      ),
    );
  }
}
