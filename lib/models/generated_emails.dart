// To parse this JSON data, do
//
//     final generatedEmailModel = generatedEmailModelFromJson(jsonString);

import 'dart:convert';

// Used app.quicktype.io for generating model class for API response
List<String> generatedEmailModelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String generatedEmailModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
