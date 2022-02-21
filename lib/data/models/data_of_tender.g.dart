// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../data/models/data_of_tender_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataOfTenderModel _$DataOfTenderFromJson(Map<String, dynamic> json) => DataOfTenderModel(
      description: json['description'] as String?,
      category: json['category'] as String?,
      title: json['title'] as String?,
      deadline_date: json['deadline_date'] as String?,
      awarded_value_eur: json['awarded_value_eur'] as String?,
    );

Map<String, dynamic> _$DataOfTenderToJson(DataOfTenderModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'category': instance.category,
      'title': instance.title,
      'deadline_date': instance.deadline_date,
      'awarded_value_eur': instance.awarded_value_eur,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestDataOfTender implements RestDataOfTender {
  _RestDataOfTender(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://tenders.guru/api/pl/tenders/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DataOfTenderModel> getDataOfTender(tender_id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DataOfTenderModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${tender_id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DataOfTenderModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
