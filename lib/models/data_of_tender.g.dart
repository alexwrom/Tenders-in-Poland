// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_of_tender.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataOfTender _$DataOfTenderFromJson(Map<String, dynamic> json) => DataOfTender(
      description: json['description'] as String?,
      category: json['category'] as String?,
      title: json['title'] as String?,
      deadline_date: json['deadline_date'] as String?,
      awarded_value_eur: json['awarded_value_eur'] as String?,
    );

Map<String, dynamic> _$DataOfTenderToJson(DataOfTender instance) =>
    <String, dynamic>{
      'description': instance.description,
      'category': instance.category,
      'title': instance.title,
      'deadline_date': instance.deadline_date,
      'awarded_value_eur': instance.awarded_value_eur,
    };
