import 'dart:io';

import 'package:dio_http/dio_http.dart';
import 'package:tenders/data/models/data_of_tender_model.dart';
import 'package:tenders/data/models/tender_model.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class TendersProvider {

    Future<List<TenderModel>> getTenders() async {
    HttpOverrides.global = MyHttpOverrides();
    final url = Uri.https('tenders.guru', 'api/pl/tenders', {'page': '1'});
    final dio = Dio();
    dio.options.headers[Headers.contentTypeHeader] = "application/json";
    final tender = RestTender(dio,baseUrl: url.toString());
    var response = tender.getTender();
    return response.then((value) => value.data);
  }

  Future<DataOfTenderModel> getDataOfTender(String tender_id) async {
    HttpOverrides.global = MyHttpOverrides();
    final dio = Dio();
    dio.options.headers[Headers.contentTypeHeader] = "application/json";
    final dataOfTender = RestDataOfTender(dio);
    var response = dataOfTender.getDataOfTender(tender_id);
    return response;
  }
}
