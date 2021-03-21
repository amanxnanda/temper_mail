import 'package:flutter/material.dart';
import 'package:temper_mail/models/mailbox_model.dart';
import 'package:temper_mail/services/services.dart';

class MailBox extends StatelessWidget {
 
  const MailBox({
    Key key,
  
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      flex: 2,
      child: Card(
        margin: EdgeInsets.only(top: 10.0),
        child: StreamBuilder(
          stream: Services().mailBoxStream(),
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
