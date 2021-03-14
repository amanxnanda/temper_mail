// To parse this JSON data, do
//
//     final generatedEmailModel = generatedEmailModelFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';
import 'package:temper_mail/services/api_endpoints.dart';
import 'package:temper_mail/services/api_response.dart';

List<String> generatedEmailModelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String generatedEmailModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));







Future<ApiResponse> getMail() async {
  Response response = await get(Uri.parse(baseURL + genEmail));

  ApiResponse res;

  try {
    if (response.statusCode >= 200 && response.statusCode <= 205) {
      res = ApiResponse(
        data: response.body,
      );
    }
  } catch (e) {
    res = ApiResponse(
      error: true,
      errorMessage: e.toString(),
    );
  }

  return res;
}
