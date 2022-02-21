import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders/core/use_case.dart';
import 'package:tenders/domain/entities/data_of_tender_entity.dart';
import 'package:tenders/domain/entities/tender_entity.dart';
import 'package:tenders/domain/usescases/get_all_tenders.dart';
import 'package:tenders/domain/usescases/get_data_of_tender.dart';
import 'package:tenders/presentation/states/states.dart';

class TenderCubit extends Cubit<States> {
  final UseCase Tenders;
  TenderCubit(this.Tenders) : super(Empty());

  Future<void> getTenders () async {

    try {
      emit (Loading());
      final List<TenderEntity> _loadedTenders = await (Tenders as GetAllTenders)('');
      emit (LoadedTenders(loadedTenders: _loadedTenders));
    } catch (error) {
      emit (Error());
    }
  }

  Future<void> getDataOfTender (String tender_id) async {
    try {
      emit (Loading());
      final DataOfTenderEntity _loadedDataOfTender = await (Tenders as GetDataOfTender)(tender_id);
      emit (LoadedDataOfTender(loadedDataOfTender: _loadedDataOfTender));
    } catch (error) {
      print('$error');
       emit (Error());
    }
  }
}