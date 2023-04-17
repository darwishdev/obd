import 'package:json_annotation/json_annotation.dart';

part 'car_models_model.g.dart';

@JsonSerializable()
class CarModelsModel {
  CarModelsModel({
    this.carBrandModelId,
    this.name,
    this.years,
  });

  final int? carBrandModelId;
  final String? name;
  final String? years;

  factory CarModelsModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarModelsModelToJson(this);
}
