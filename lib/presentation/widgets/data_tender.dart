import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders/core/functions.dart';
import 'package:tenders/presentation/cubit/cubit.dart';
import 'package:tenders/presentation/states/states.dart';

import '../../core/myconsts.dart';

class DataTender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TenderCubit, States>(builder: (context, state) {
      if (state is Empty)
        return Center(
          child: Text(
            'No data',
            style: TextStyle(color: secondColor, fontSize: 20),
          ),
        );
      if (state is Loading)
        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: secondColor,
          ),
        );

      if (state is Error)
        return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Error getting data',
            style: TextStyle(color: secondColor, fontSize: 20),
          ),
        ]));

      if (state is LoadedDataOfTender) {

        return Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                getCard('category',state.loadedDataOfTender.category, addIcon: true),
                // Category
                getCard('title',state.loadedDataOfTender.title),
                // Title
                getCard('description',state.loadedDataOfTender.description),
                // Description
                getCard('deadline_date',state.loadedDataOfTender.deadline_date),
                // Deadline date
                getCard('awarded_value_eur',state.loadedDataOfTender.awarded_value_eur,
                    addAfterStr: '€'),
                // Awarded value
              ],
            ),
          ),
        );
      }
      ;

      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: secondColor,
        ),
      );
    });
  }
}
