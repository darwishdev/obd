import 'package:json_annotation/json_annotation.dart';

part 'obd_model.g.dart';

@JsonSerializable()
class OBDModel {
  final String? speed;
  final String? rpm;
  final String? airIntakeTemp;
  final String? engineLoad;
  final String? moduleVoltage;
  final String? oilTemp;
  final String? airFuelRatio;
  final String? fuelPressure;

  OBDModel({
    this.speed,
    this.rpm,
    this.airIntakeTemp,
    this.engineLoad,
    this.moduleVoltage,
    this.oilTemp,
    this.airFuelRatio,
    this.fuelPressure,
  });

  factory OBDModel.fromJson(Map<String, dynamic> json) =>
      _$OBDModelFromJson(json);

  Map<String, dynamic> toJson() => _$OBDModelToJson(this);
}
