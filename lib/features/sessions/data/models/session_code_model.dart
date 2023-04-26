import 'package:json_annotation/json_annotation.dart';
import 'package:obd/core/models/paginated_model.dart';

part 'session_code_model.g.dart';

@JsonSerializable()
class SessionCodeModel implements PaginatedModel {
  SessionCodeModel({
    this.codeId,
    this.carBrandModelId,
    this.codeName,
    this.vehiclePart,
    this.codeType,
    this.description,
    this.isEmergency,
  });

  final int? codeId;
  final int? carBrandModelId;
  final String? codeName;
  @JsonKey(name: 'VehiclePart')
  final String? vehiclePart;
  @JsonKey(name: 'CodeType')
  final String? codeType;
  final String? description;
  final bool? isEmergency;

  factory SessionCodeModel.fromJson(Map<String, dynamic> json) =>
      _$SessionCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionCodeModelToJson(this);
}
