import 'package:json_annotation/json_annotation.dart';
import 'package:obd/core/models/paginated_model.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel implements PaginatedModel {
  ReviewModel({
    this.userName,
    this.centerName,
    this.review,
    this.rate,
    this.createdAt,
  });

  final String? userName;
  final String? centerName;
  final String? review;
  final int? rate;
  final String? createdAt;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
