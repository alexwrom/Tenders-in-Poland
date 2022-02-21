
import 'package:tenders/core/use_case.dart';
import 'package:tenders/domain/entities/tender_entity.dart';
import 'package:tenders/domain/repositories/repository.dart';

class GetAllTenders extends UseCase<List<TenderEntity>, String>{
  final TendersRepository tendersRepository;

  GetAllTenders(this.tendersRepository);

  Future<List<TenderEntity>> call(String params) async {
    return await tendersRepository.getAllTenders();
  }

}
