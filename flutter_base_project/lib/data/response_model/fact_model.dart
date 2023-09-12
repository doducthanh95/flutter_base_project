// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<FactModel> welcomeFromJson(String str) =>
    List<FactModel>.from(json.decode(str).map((x) => FactModel.fromJson(x)));

String welcomeToJson(List<FactModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FactModel {
  Status? status;
  String? id;
  String? user;
  String? text;
  int? v;
  String? source;
  DateTime? updatedAt;
  String? type;
  DateTime? createdAt;
  bool? deleted;
  bool? used;

  FactModel({
    this.status,
    this.id,
    this.user,
    this.text,
    this.v,
    this.source,
    this.updatedAt,
    this.type,
    this.createdAt,
    this.deleted,
    this.used,
  });

  factory FactModel.fromJson(Map<String, dynamic> json) => FactModel(
        status: json['status'] == null ? null : Status.fromJson(json['status']),
        id: json['_id'],
        user: json['user'],
        text: json['text'],
        v: json['__v'],
        source: json['source'],
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt']),
        type: json['type'],
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt']),
        deleted: json['deleted'],
        used: json['used'],
      );

  Map<String, dynamic> toJson() => {
        'status': status?.toJson(),
        '_id': id,
        'user': user,
        'text': text,
        '__v': v,
        'source': source,
        'updatedAt': updatedAt?.toIso8601String(),
        'type': type,
        'createdAt': createdAt?.toIso8601String(),
        'deleted': deleted,
        'used': used,
      };
}

class Status {
  bool? verified;
  int? sentCount;
  String? feedback;

  Status({
    this.verified,
    this.sentCount,
    this.feedback,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        verified: json['verified'],
        sentCount: json['sentCount'],
        feedback: json['feedback'],
      );

  Map<String, dynamic> toJson() => {
        'verified': verified,
        'sentCount': sentCount,
        'feedback': feedback,
      };
}
