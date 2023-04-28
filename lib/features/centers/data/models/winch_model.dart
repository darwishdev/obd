import 'package:json_annotation/json_annotation.dart';
import 'package:obd/core/models/paginated_model.dart';

part 'winch_model.g.dart';

@JsonSerializable()
class WinchModel implements PaginatedModel {
  WinchModel({
    this.winchID,
    this.name,
    this.phone,
    this.driverName,
    this.driverPhone,
    this.lat,
    this.long,
    this.createdAt,
    this.distance,
  });

  @JsonKey(name: 'WinchID')
  final int? winchID;
  @JsonKey(name: 'Name')
  final String? name;
  @JsonKey(name: 'Phone')
  final String? phone;
  @JsonKey(name: 'DriverName')
  final String? driverName;
  @JsonKey(name: 'DriverPhone')
  final String? driverPhone;
  @JsonKey(name: 'Lat')
  final double? lat;
  @JsonKey(name: 'Long')
  final double? long;
  @JsonKey(name: 'CreatedAt')
  final String? createdAt;
  @JsonKey(name: 'Distance')
  final double? distance;

  factory WinchModel.fromJson(Map<String, dynamic> json) =>
      _$WinchModelFromJson(json);

  Map<String, dynamic> toJson() => _$WinchModelToJson(this);
}
