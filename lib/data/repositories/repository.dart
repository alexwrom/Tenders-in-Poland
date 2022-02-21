import 'package:tenders/data/datasources/api_provider.dart';
import 'package:tenders/data/models/data_of_tender_model.dart';
import 'package:tenders/data/models/tender_model.dart';
import 'package:tenders/domain/repositories/repository.dart';


class TendersRepositoryData extends TendersRepository{
  final TendersProvider _tendersProvider = TendersProvider();
  Future<List<TenderModel>> getAllTenders() => _tendersProvider.getTenders();
  Future<DataOfTenderModel> getDataOfTender(String tender_id) => _tendersProvider.getDataOfTender(tender_id);
}