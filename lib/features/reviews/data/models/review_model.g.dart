// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      userName: json['userName'] as String?,
      centerName: json['centerName'] as String?,
      review: json['review'] as String?,
      rate: json['rate'] as int?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'centerName': instance.centerName,
      'review': instance.review,
      'rate': instance.rate,
      'createdAt': instance.createdAt,
    };
