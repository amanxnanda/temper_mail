// To parse this JSON data, do
//
//     final mailboxModel = mailboxModelFromJson(jsonString);

import 'dart:convert';

List<MailboxModel> mailboxModelFromJson(String str) => List<MailboxModel>.from(json.decode(str).map((x) => MailboxModel.fromJson(x)));

String mailboxModelToJson(List<MailboxModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MailboxModel {
    MailboxModel({
        this.id,
        this.from,
        this.subject,
        this.date,
    });

    int id;
    String from;
    String subject;
    DateTime date;

    factory MailboxModel.fromJson(Map<String, dynamic> json) => MailboxModel(
        id: json["id"],
        from: json["from"],
        subject: json["subject"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "from": from,
        "subject": subject,
        "date": date.toIso8601String(),
    };
}
