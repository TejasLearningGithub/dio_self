import 'package:dio_second_self/model/data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  Data? data;

  User({required this.data});

  factory User.fromJson(Map<String, dynamic> myJson) => _$UserFromJson(myJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
