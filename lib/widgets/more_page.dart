import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders/cubit/cubit.dart';
import 'package:tenders/services/repository.dart';
import 'package:tenders/widgets/data_tender.dart';
import '../myconsts.dart';
import 'button_reload.dart';

class MorePage extends StatelessWidget {
  final String tender_id;

  MorePage({required this.tender_id}) : super();

  final tendersRepository = TendersRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TenderCubit>(
      create: (context) => TenderCubit(tendersRepository),
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
