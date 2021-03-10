import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text('Fake Mail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/img.png'),
          Card(
            elevation: 5.0,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text('example@gmail.com'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.autorenew),
                label: Text('Refresh'),
                style: OutlinedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: Colors.amber,
                  padding: EdgeInsets.all(20),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.copy),
                label: Text('Clipboard'),
                style: OutlinedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: Colors.amber,
                  padding: EdgeInsets.all(20),
                ),
              ),
            ],
          ),
          Expanded(
            child: Card(
              margin: EdgeInsets.only(top: 10.0),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  for (var i = 0; i < 10; i++)
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
