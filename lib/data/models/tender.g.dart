// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tender_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TenderModel _$TenderFromJson(Map<String, dynamic> json) => TenderModel(
      id: json['id'] as String,
      category: json['category'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$TenderToJson(TenderModel instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'title': instance.title,
    };

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      data: (json['data'] as List<dynamic>)
          .map((e) => TenderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'data': instance.data,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestTender implements RestTender {
  _RestTender(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Page> getTender() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Page>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Page.fromJson(_result.data!);
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
