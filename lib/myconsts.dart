import 'package:flutter/material.dart';

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
  };
}

Color getColorCategory(String category) {
  switch (category) {
    case 'supplies': return Colors.deepOrangeAccent;
    case 'constructions': return Colors.cyan;
    case 'services': return Colors.lightGreen;
    default: return Colors.purple;
  };
}