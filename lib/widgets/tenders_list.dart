import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders/cubit/cubic.dart';
import 'package:tenders/cubit/states.dart';

import '../myconsts.dart';
import 'more_page.dart';

class TendersList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TenderCubit, States>(
      builder: (context, state) {
        if (state is Empty)
          return Center(
            child:
                Text(
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
            child: Text(
              'Error loading tenders',
              style: TextStyle(fontSize: 20),
            ),
          );

        if (state is LoadedTenders)
          return ListView.builder(
              itemCount: state.loadedTenders.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: secondColor,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              MorePage(tender_id: state.loadedTenders[index].id)));

                    },
                    title: Text(
                      state.loadedTenders[index].title,
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          getCategory(state.loadedTenders[index].category),
                          color: getColorCategory(
                              state.loadedTenders[index].category),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.white24,
                    ),
                  ),
                );
              });

        return Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: secondColor,
          ),
        );
      },
    );
  }
}
