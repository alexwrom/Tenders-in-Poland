import 'package:dio_http/dio_http.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'tender.g.dart';


@RestApi()
abstract class RestTender {
  factory RestTender(Dio dio, {String baseUrl}) = _RestTender;

  @GET("")
  Future<Page> getTender();
}

@JsonSerializable()
class Tender {
  final String id;
  final String category;
  final String title;

  Tender({required this.id,required this.category,required this.title});

  factory Tender.fromJson(Map<String,dynamic> json) => _$TenderFromJson(json);
}

@JsonSerializable()
class Page {
  final List<Tender> data;
  Page({required this.data});

  factory Page.fromJson(Map<String,dynamic> json) => _$PageFromJson(json);
}

