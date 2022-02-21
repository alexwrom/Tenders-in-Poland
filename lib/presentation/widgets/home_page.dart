import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders/core/myconsts.dart';
import 'package:tenders/data/repositories/repository.dart';

import 'package:tenders/domain/usescases/get_all_tenders.dart';
import 'package:tenders/presentation/cubit/cubit.dart';
import 'package:tenders/presentation/widgets/tenders_list.dart';

import 'button_reload.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final repository = TendersRepositoryData();
    final allTenders = GetAllTenders(repository);
    return BlocProvider<TenderCubit>(
      create: (context) => TenderCubit(allTenders),
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
            ButtonReload(mode: Mode.modeTenders),
          ],
        ),
        body: TendersList(),
      ),
    );
  }
}
