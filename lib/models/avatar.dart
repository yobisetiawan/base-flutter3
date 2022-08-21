import 'package:json_annotation/json_annotation.dart';

part 'avatar.g.dart';

@JsonSerializable()
class AvatarModel {
  AvatarModel({required this.id, required this.url});

  String id;
  String url;

  /// Connect the generated [_$AvatarModelFromJson] function to the `fromJson`
  /// factory.
  factory AvatarModel.fromJson(Map<String, dynamic> json) =>
      _$AvatarModelFromJson(json);

  /// Connect the generated [_$AvatarModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AvatarModelToJson(this);
}
