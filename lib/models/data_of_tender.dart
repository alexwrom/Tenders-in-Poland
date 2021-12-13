import 'package:json_annotation/json_annotation.dart';

part 'data_of_tender.g.dart';

@JsonSerializable()
class DataOfTender {
  final String? description;
  final String? category;
  final String? title;
  final String? deadline_date;
  final String? awarded_value_eur;

  DataOfTender({this.description,this.category,this.title,this.deadline_date,this.awarded_value_eur});

  factory DataOfTender.fromJson(dynamic json) => _$DataOfTenderFromJson(json);

  Map<String,dynamic> toJson() => _$DataOfTenderToJson(this);
}