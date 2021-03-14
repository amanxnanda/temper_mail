import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:temper_mail/models/generated_emails.dart';
import 'package:temper_mail/services/api_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = "example@yourmail.com";
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
                  var finalEmail = generatedEmailModelFromJson(res.data);
                  setState(() {
                    email = finalEmail[0];
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
                onPressed: () {},
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
          Expanded(
            flex: 2,
            child: Card(
              margin: EdgeInsets.only(top: 10.0),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  for (var i = 1; i < 10; i++)
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text('$i Name'),
                      subtitle: Text('Subject'),
                      trailing: Text('12:0$i pm'),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
