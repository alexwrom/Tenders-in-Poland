
import 'package:tenders/data/repositories/repository.dart';
import 'package:tenders/domain/entities/data_of_tender_entity.dart';
import 'package:tenders/domain/entities/tender_entity.dart';


abstract class TendersRepository {
  Future<List<TenderEntity>> getAllTenders();
  Future<DataOfTenderEntity> getDataOfTender(String tender_id);
}