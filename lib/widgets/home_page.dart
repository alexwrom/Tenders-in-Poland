import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders/cubit/cubic.dart';
import 'package:tenders/myconsts.dart';
import 'package:tenders/services/repository.dart';
import 'package:tenders/widgets/button_reload.dart';
import 'package:tenders/widgets/tenders_list.dart';



class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final tendersRepository = TendersRepository();
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
            ButtonReload(mode: Mode.modeTenders),
          ],
        ),
        body: TendersList(),
      ),
    );
  }
}
