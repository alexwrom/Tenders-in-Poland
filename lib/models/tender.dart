import 'package:json_annotation/json_annotation.dart';

part 'tender.g.dart';

@JsonSerializable()
class Tender {
  final String id;
  final String category;
  final String title;

  Tender({required this.id,required this.category,required this.title});

  factory Tender.fromJson(Map<String,dynamic> json) => _$TenderFromJson(json);

  Map<String, dynamic> toJson() => _$TenderToJson(this);
}

