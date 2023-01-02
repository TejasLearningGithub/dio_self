import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? id;
  String? first_name;
  String? last_name;
  String? email;
  String? avatar;

  Data({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
