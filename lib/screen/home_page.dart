import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fake Mail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/img.png'),
          Card(
            elevation: 10.0,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('example@gmail.com'),
            ),
          ),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.redo),
                label: Text('Regenerate'),

                
              ),
            ],
          ),
        ],
      ),
    );
  }
}
