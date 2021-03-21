// To parse this JSON data, do
//
//     final mailboxModel = mailboxModelFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';
import 'package:temper_mail/services/api_endpoints.dart';
import 'package:temper_mail/services/api_response.dart';

// Used app.quicktype.io for generating model class for API response

List<MailboxModel> mailboxModelFromJson(String str) => List<MailboxModel>.from(
    json.decode(str).map((x) => MailboxModel.fromJson(x)));

String mailboxModelToJson(List<MailboxModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

Future<ApiResponse> getMailBox(String username, String domain) async {
  Response response = await get(Uri.parse(
      baseURL + '?action=getMessages&login=$username&domain=$domain'));

  ApiResponse res;

  try {
    if (response.statusCode >= 200 && response.statusCode <= 205) {
      res = ApiResponse(data: response.body);
    }
  } catch (e) {
    res = ApiResponse(
      error: true,
      errorMessage: e.toString(),
    );
  }
  // await Future.delayed(Duration(seconds: 5));
  return res;
}

Stream<ApiResponse> mailBoxStream(String username, String domain) async* {
  while (true) {
    yield await getMailBox(username, domain);
  }
}
