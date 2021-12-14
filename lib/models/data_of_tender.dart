import 'package:dio_http/dio_http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'data_of_tender.g.dart';

@RestApi(baseUrl: "https://tenders.guru/api/pl/tenders/")
abstract class RestDataOfTender {
  factory RestDataOfTender(Dio dio, {String baseUrl}) = _RestDataOfTender;

  @GET("/{tender_id}")
  Future<DataOfTender> getDataOfTender(@Path("tender_id") String tender_id);
}

@JsonSerializable()
class DataOfTender {
  final String? description;
  final String? category;
  final String? title;
  final String? deadline_date;
  final String? awarded_value_eur;

  DataOfTender({this.description,this.category,this.title,this.deadline_date,this.awarded_value_eur});

  factory DataOfTender.fromJson(dynamic json) => _$DataOfTenderFromJson(json);
}