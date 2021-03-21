import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:temper_mail/controller/email_controller.dart';
import 'api_endpoints.dart';
import 'api_response.dart';

class Services {
  String _username = Get.find<EmailController>().emailModel.value.username;
  String _domain = Get.find<EmailController>().emailModel.value.domain;

  Future<ApiResponse> getMail() async {
    http.Response response = await http.get(Uri.parse(baseURL + genEmail));

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

  Future<ApiResponse> readMessage(int id) async {
    http.Response response = await http.get(Uri.parse(
        baseURL + '?action=readMessage&login=$_username&domain=$_domain&id=$id'));

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

  Future<ApiResponse> getMailBox() async {
    http.Response response = await http.get(Uri.parse(
        baseURL + '?action=getMessages&login=$_username&domain=$_domain'));
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

  Stream<ApiResponse> mailBoxStream() async* {
    while (true) {
      yield await getMailBox();
    }
  }
}
