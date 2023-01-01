import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

import '../components/constants.dart';

class DataService {
  Future<List<List<dynamic>>> loadCSV() async {
    final rawData = await rootBundle.loadString(kDataAsset);
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    return listData;
  }
}
