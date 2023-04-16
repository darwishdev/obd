import 'package:json_annotation/json_annotation.dart';

part 'car_model.g.dart';

@JsonSerializable()
class CarModel {
  CarModel({
    this.carId,
    this.carBrandId,
    this.carBrandModelId,
    this.brandName,
    this.brandModelName,
    this.modelYear,
  });

  final int? carId;
  final int? carBrandId;
  final int? carBrandModelId;
  final String? brandName;
  final String? brandModelName;
  final int? modelYear;

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarModelToJson(this);
}
