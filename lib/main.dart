// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:temper_mail/screen/home_page.dart';

// import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fake Mail Generator',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}

// const String appID =
//     '604d79fa0d3499e757b61af4'; //logined to dummyAPI, uski API token

// class Example extends StatelessWidget {
//   const Example({Key key}) : super(key: key);

//   final String url =
//       'https://dummyapi.io/data/api/user/0F8JIqi4zwvb77FGz6Wt'; //dummyAPI ek user detail ur;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             http.Response response = await http.get(
//               //await is used because we dont want our app to get stuck so that it can do some useful work when it is waiting for a response
//               Uri.parse(url),
//               headers: {'app-id': appID},
//             );

//             print(response.statusCode);
//             print(jsonDecode(response.body));
//           },
//           child: Text('Click Me!'),
//         ),
//       ),
//     );
//   }
// }
