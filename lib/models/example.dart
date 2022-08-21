import 'package:json_annotation/json_annotation.dart';

part 'example.g.dart';

@JsonSerializable()
class ExampleModel {
  ExampleModel({required this.id, required this.title, required this.slug});

  String id;
  String title;
  String slug;

  /// Connect the generated [_$ExampleModelFromJson] function to the `fromJson`
  /// factory.
  factory ExampleModel.fromJson(Map<String, dynamic> json) =>
      _$ExampleModelFromJson(json);

  /// Connect the generated [_$ExampleModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ExampleModelToJson(this);
}
