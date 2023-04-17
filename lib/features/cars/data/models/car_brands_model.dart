import 'package:json_annotation/json_annotation.dart';
import 'package:obd/features/cars/data/models/car_models_model.dart';

part 'car_brands_model.g.dart';

@JsonSerializable()
class CarBrandsModel {
  CarBrandsModel({
    this.carBrandId,
    this.name,
    this.models,
  });

  final int? carBrandId;
  final String? name;
  final List<CarModelsModel>? models;

  factory CarBrandsModel.fromJson(Map<String, dynamic> json) =>
      _$CarBrandsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarBrandsModelToJson(this);
}
