class EmailModel {
  String email;

  EmailModel({this.email = 'aman@1secmail.com'});

  String get username => email.split('@')[0];
  String get domain => email.split('@')[1];
}
