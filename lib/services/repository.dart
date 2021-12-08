import 'package:tenders/models/data_of_tender.dart';
import 'package:tenders/models/tender.dart';
import 'package:tenders/services/api_provider.dart';

class TendersRepository {
  final TendersProvider _tendersProvider = TendersProvider();
  Future<List<Tender>> getAllTenders() => _tendersProvider.getTenders();
  Future<DataOfTender> getDataOfTender(tender_id) => _tendersProvider.getDataOfTender(tender_id);
}