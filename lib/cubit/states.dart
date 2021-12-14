import 'package:tenders/models/tender.dart';

abstract class States {}

class Loading extends States {}

class LoadedTenders extends States {
  //List<dynamic> loadedTenders;
  dynamic loadedTenders;
  LoadedTenders({required this.loadedTenders});
}

class LoadedDataOfTender extends States {
  dynamic loadedDataOfTender;
  LoadedDataOfTender({required this.loadedDataOfTender});
}

class Error extends States {}

class Empty extends States {}