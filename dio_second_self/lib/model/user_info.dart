import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  String? name;
  String? createdAt;
  String? updatedAt;
  String? id;
  String? job;

  UserInfo(
      {required this.name,
      required this.job,
      this.id,
      this.createdAt,
      this.updatedAt});

  factory UserInfo.fromJson(Map<String, dynamic> myJson) =>
      _$UserInfoFromJson(myJson);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
