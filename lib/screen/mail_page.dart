import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:temper_mail/models/email_body_model.dart';
import 'package:temper_mail/services/api_endpoints.dart';
import 'package:temper_mail/services/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MailPage extends StatefulWidget {
  final int id;
  const MailPage({Key key, @required this.id}) : super(key: key);

  @override
  _MailPageState createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Services().readMessage(widget.id),
        builder: (c, s) {
          var widget;

          if (s.connectionState == ConnectionState.waiting) {
            widget = Center(child: CircularProgressIndicator());
          } else if (s.connectionState == ConnectionState.done) {
            var ebm = emailBodyModelFromJson(s.data.data);

            widget = WebView(
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController c) {
                _controller = c;

                _controller.loadUrl(
                  Uri.dataFromString(
                    ebm.htmlBody,
                    mimeType: 'text/html',
                    encoding: Encoding.getByName('utf-8'),
                  ).toString(),
                );
              },
            );
          } else {
            widget = Center(child: Text('Something went wrong'));
          }

          return widget;
        },
      ),
    );
  }
}
