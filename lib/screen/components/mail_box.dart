import 'package:flutter/material.dart';
import 'package:temper_mail/models/mailbox_model.dart';

class MailBox extends StatelessWidget {
  final String username;
  final String domain;
  const MailBox({
    Key key,
   @required this.username,
    @required this.domain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: for testing

    // String username = 'aman';
    // String domain = '1secmail.com';
    return Expanded(
      flex: 2,
      child: Card(
        margin: EdgeInsets.only(top: 10.0),
        child: StreamBuilder(
          stream: mailBoxStream(username, domain),
          builder: (c, s) {
            var widget;

            if (s.connectionState == ConnectionState.waiting) {
              widget = Center(child: CircularProgressIndicator());
            } else if (s.connectionState == ConnectionState.active) {
              if (mailboxModelFromJson(s.data.data).isNotEmpty) {
                var sd = mailboxModelFromJson(s.data.data);

                widget = ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: sd.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(),
                      title: Text(sd[index].from),
                      subtitle: Text(sd[index].subject),
                      trailing: Text(sd[index].date.toString()),
                    );
                  },
                );
              } else {
                widget = Center(child: Text('Empty Mail'));
              }
            } else {
              widget = Center(child: Text('Something went wrong'));
            }

            return widget;
          },
        ),
      ),
    );
  }
}