// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tender.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tender _$TenderFromJson(Map<String, dynamic> json) => Tender(
      id: json['id'] as String,
      category: json['category'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$TenderToJson(Tender instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'title': instance.title,
    };