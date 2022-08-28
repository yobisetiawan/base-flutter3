import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable()
class AppointmentModel {
  AppointmentModel(
      {required this.id, required this.number, required this.title});

  String id;
  String number;
  String title;

  /// Connect the generated [_$AppointmentModelFromJson] function to the `fromJson`
  /// factory.
  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  /// Connect the generated [_$AppointmentModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}
