import 'package:dio_http/dio_http.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:tenders/domain/entities/data_of_tender_entity.dart';

part '../../data/models/data_of_tender.g.dart';

@RestApi(baseUrl: "https://tenders.guru/api/pl/tenders/")
abstract class RestDataOfTender {
  factory RestDataOfTender(Dio dio, {String baseUrl}) = _RestDataOfTender;

  @GET("/{tender_id}")
  Future<DataOfTenderModel> getDataOfTender(@Path("tender_id") String tender_id);
}

@JsonSerializable()
class DataOfTenderModel extends DataOfTenderEntity{
  DataOfTenderModel({
    @required description,
    @required category,
    @required title,
    @required deadline_date,
    @required awarded_value_eur,
}) : super (
      description: description,
      category: category,
      title: title,
      deadline_date: deadline_date,
      awarded_value_eur: awarded_value_eur,
  );

  factory DataOfTenderModel.fromJson(dynamic json) => _$DataOfTenderFromJson(json);
}