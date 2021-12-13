import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders/cubit/states.dart';
import 'package:tenders/models/data_of_tender.dart';
import 'package:tenders/models/tender.dart';
import 'package:tenders/services/repository.dart';

class TenderCubit extends Cubit<States> {
  final TendersRepository tendersRepository;
  TenderCubit(this.tendersRepository) : super(Empty());

  Future<void> getTenders () async {

    try {
      emit (Loading());
      final List<Tender> _loadedTenders =
      await tendersRepository.getAllTenders();
      emit (LoadedTenders(loadedTenders: _loadedTenders));
    } catch (error) {
      emit (Error());
    }
  }

  Future<void> getDataOfTender (String tender_id) async {
    try {
      emit (Loading());
      final DataOfTender _loadedDataOfTender =
      await tendersRepository.getDataOfTender(tender_id);
      emit (LoadedDataOfTender(loadedDataOfTender: _loadedDataOfTender));
    } catch (error) {
      print('$error');
       emit (Error());
    }
  }
}