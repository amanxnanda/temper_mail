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

// const String appID = '604d79fa0d3499e757b61af4';

// class Example extends StatelessWidget {
//   const Example({Key key}) : super(key: key);

//   final String url = 'https://dummyapi.io/data/api/user/0F8JIqi4zwvb77FGz6Wt';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             http.Response response = await http.get(
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
