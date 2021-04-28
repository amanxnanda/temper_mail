// To parse this JSON data, do
//
//     final emailBodyModel = emailBodyModelFromJson(jsonString);

import 'dart:convert';

EmailBodyModel emailBodyModelFromJson(String str) => EmailBodyModel.fromJson(json.decode(str));

String emailBodyModelToJson(EmailBodyModel data) => json.encode(data.toJson());

class EmailBodyModel {
    EmailBodyModel({
        this.id,
        this.from,
        this.subject,
        this.date,
        this.attachments,
        this.body,
        this.textBody,
        this.htmlBody,
    });

    int id;
    String from;
    String subject;
    DateTime date;
    List<Attachment> attachments;
    String body;
    String textBody;
    String htmlBody;

    factory EmailBodyModel.fromJson(Map<String, dynamic> json) => EmailBodyModel(
        id: json["id"],
        from: json["from"],
        subject: json["subject"],
        date: DateTime.parse(json["date"]),
        attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
        body: json["body"],
        textBody: json["textBody"],
        htmlBody: json["htmlBody"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "from": from,
        "subject": subject,
        "date": date.toIso8601String(),
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
        "body": body,
        "textBody": textBody,
        "htmlBody": htmlBody,
    };
}

class Attachment {
    Attachment({
        this.filename,
        this.contentType,
        this.size,
    });

    String filename;
    String contentType;
    int size;

    factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        filename: json["filename"],
        contentType: json["contentType"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "filename": filename,
        "contentType": contentType,
        "size": size,
    };
}
