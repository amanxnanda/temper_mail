import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:temper_mail/models/generated_emails.dart';
import 'package:temper_mail/models/mailbox_model.dart';
import 'package:temper_mail/screen/components/mail_box.dart';
import 'package:temper_mail/services/api_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var model;
  String email = "aman@1secmail.com";
  var finalEmail;

  String username, domain;
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
              child: Text(email),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton.icon(
                onPressed: () async {
                  ApiResponse res = await getMail();
                  // print(res.data);
                  finalEmail = generatedEmailModelFromJson(res.data);
                  setState(() {
                    email = finalEmail[0];
                    var paraList = email.split('@');
                    username = paraList[0];
                    domain = paraList[1];
                  });
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
                  Clipboard.setData(new ClipboardData(text: finalEmail[0]))
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
          MailBox(
            username: username,
            domain: domain,
          ),
        ],
      ),
    );
  }
}
