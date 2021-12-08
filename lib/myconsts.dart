import 'package:flutter/material.dart';

import 'cubit/cubic.dart';

enum Mode {modeTenders,modeDataOfTender}
final String projectTitle = 'Tenders in Poland';
final Color colorBack = Colors.white;
final Color textColor = Colors.white;
final Color secondColor = Colors.blueGrey;

IconData getCategory(String category) {
  switch (category) {
    case 'supplies': return Icons.business_center_rounded;
    case 'constructions': return Icons.construction;
    case 'services': return Icons.cleaning_services_rounded;
    default: return Icons.ac_unit;
  }
}

Color getColorCategory(String category) {
  switch (category) {
    case 'supplies': return Colors.deepOrangeAccent;
    case 'constructions': return Colors.cyan;
    case 'services': return Colors.lightGreen;
    default: return Colors.purple;
  }
}

getCard(String title, dynamic name,
    {bool addIcon = false, String addAfterStr = ''}) {
  return Card(
    color: secondColor,
    child: ListTile(
      title: Text(
        '${title[0].toUpperCase() + title.substring(1).replaceAll('_', ' ')}:',
        style: TextStyle(
            fontSize: 16,
            color: textColor,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '${name} ${addAfterStr}',
        style: TextStyle(fontSize: 16, color: textColor),
      ),
      trailing: addIcon
          ? Icon(
        getCategory(
          name,
        ),
        color:
        getColorCategory(name),
      )
          : null,
    ),
  );
}

reload (TenderCubit tenderCubit, Mode mode,{String? tender_id}) {
  if (mode == Mode.modeTenders) {
    tenderCubit.getTenders();
  } else {
    tenderCubit.getDataOfTender(tender_id!);
  }

}

