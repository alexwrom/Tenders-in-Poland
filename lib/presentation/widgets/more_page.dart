import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders/data/repositories/repository.dart';
import 'package:tenders/domain/usescases/get_data_of_tender.dart';
import 'package:tenders/presentation/cubit/cubit.dart';
import '../../core/myconsts.dart';
import 'button_reload.dart';
import 'data_tender.dart';

class MorePage extends StatelessWidget {
  final String tender_id;

  MorePage({required this.tender_id}) : super();

  @override
  Widget build(BuildContext context) {
    final repository = TendersRepositoryData();
    final dataOfTender = GetDataOfTender(repository);
    return BlocProvider<TenderCubit>(
      create: (context) => TenderCubit(dataOfTender),
      child: Scaffold(
          backgroundColor: colorBack,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: secondColor,
            title: Text(
              projectTitle,
              style: TextStyle(
                color: textColor,
              ),
            ),
            actions: [
              ButtonReload(mode: Mode.modeDataOfTender,tender_id: tender_id),
            ],
          ),
          body: DataTender()),
    );
  }
}
