import 'package:json_annotation/json_annotation.dart';
import 'package:obd/core/models/paginated_model.dart';

part 'session_model.g.dart';

@JsonSerializable()
class SessionModel implements PaginatedModel {
  SessionModel({
    this.sessionId,
    this.carId,
    this.emergencies,
    this.defaultCodes,
    this.createdAt,
    this.finishedAt,
  });

  final int? sessionId;
  final int? carId;
  final int? emergencies;
  final int? defaultCodes;
  final String? createdAt;
  final String? finishedAt;

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}
