import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tenders/models/data_of_tender.dart';
import 'package:tenders/models/tender.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class TendersProvider {
    Future<List<Tender>> getTenders() async {
    HttpOverrides.global = MyHttpOverrides();
    final url = Uri.https('tenders.guru', 'api/pl/tenders', {'page': '1'});
    final response =
        await http.get(url, headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      final  List<dynamic> tenderJson = data;
      return tenderJson.map((json) => Tender.fromJson(json)).toList();
    } else {
       throw Exception('Error loading tenders');
    }
  }

  Future<DataOfTender> getDataOfTender(String tender_id) async {
    HttpOverrides.global = MyHttpOverrides();
    final url = Uri.https('tenders.guru', 'api/pl/tenders/$tender_id');
    final response =
        await http.get(url, headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      //final DataOfTender dataTenderJson = json.decode(response.body);
      return DataOfTender.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error loading tenders');
    }
  }
}
