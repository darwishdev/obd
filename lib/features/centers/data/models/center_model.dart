import 'package:json_annotation/json_annotation.dart';
import 'package:obd/core/models/paginated_model.dart';

part 'center_model.g.dart';

@JsonSerializable()
class CenterModel implements PaginatedModel {
  CenterModel({
    this.centerId,
    this.name,
    this.phone,
    this.address,
    this.areaId,
    this.lat,
    this.long,
    this.distance,
    this.createdAt,
  });

  final int? centerId;
  final String? name;
  final String? phone;
  final String? address;
  final int? areaId;
  final double? lat;
  final double? long;
  final double? distance;
  final String? createdAt;

  factory CenterModel.fromJson(Map<String, dynamic> json) =>
      _$CenterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CenterModelToJson(this);
}
