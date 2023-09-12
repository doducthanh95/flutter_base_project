import 'package:json_annotation/json_annotation.dart';

import 'error_model.dart';

part 'response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseModel<T> {
  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'data')
  T? data;

  @JsonKey(name: 'error')
  ErrorModel? error;

  @JsonKey(name: "messages")
  List<String>? messages;

  ResponseModel({this.success, this.data, this.error});

  factory ResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ResponseModelFromJson(json, fromJsonT);
}
