import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginRequestModel {
  final String email;
  final String password;

  LoginRequestModel({required this.email, required this.password});
}