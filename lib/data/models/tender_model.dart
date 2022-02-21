import 'package:dio_http/dio_http.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tenders/domain/entities/tender_entity.dart';

part '../../data/models/tender.g.dart';


@RestApi()
abstract class RestTender {
  factory RestTender(Dio dio, {String baseUrl}) = _RestTender;

  @GET("")
  Future<Page> getTender();
}

@JsonSerializable()
class TenderModel extends TenderEntity{
  TenderModel({
    @required id,
    @required category,
    @required title,
}) : super(
    id: id,
    category: category,
    title: title,
  );

  factory TenderModel.fromJson(Map<String,dynamic> json) => _$TenderFromJson(json);
}

@JsonSerializable()
class Page {
  final List<TenderModel> data;
  Page({required this.data});

  factory Page.fromJson(Map<String,dynamic> json) => _$PageFromJson(json);
}

