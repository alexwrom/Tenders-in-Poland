import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders/cubit/cubic.dart';

import '../myconsts.dart';

class ButtonReload extends StatelessWidget {
  final Mode mode;
  final String? tender_id;
  ButtonReload({required this.mode,this.tender_id});

  @override
  Widget build(BuildContext context) {

    final TenderCubit tenderCubit = context.read<TenderCubit>();
    reload(tenderCubit,mode,tender_id: tender_id);
    return IconButton(
        color: Colors.white,
        onPressed: () {
          reload(tenderCubit,mode,tender_id: tender_id);
        },
        icon: Icon(Icons.refresh));
  }
}
