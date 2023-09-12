import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginResponseModel {
  final String accessToken;
  final String refreshToken;
  final String tokenType;

  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
