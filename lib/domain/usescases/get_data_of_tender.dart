
import 'package:tenders/core/use_case.dart';
import 'package:tenders/domain/entities/data_of_tender_entity.dart';
import 'package:tenders/domain/repositories/repository.dart';

class GetDataOfTender extends UseCase<DataOfTenderEntity, String>{
  final TendersRepository tendersRepository;

  GetDataOfTender(this.tendersRepository);

  Future<DataOfTenderEntity> call(String params) async {
    return await tendersRepository.getDataOfTender(params);
  }

}
