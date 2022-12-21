void main() async {
  DataService dataService = DataService();
  String data = await dataService.getDataAlt();
  print(data);
}

class DataService {
  Future<String> _getDataFromCloud() async {
    await Future.delayed(Duration(seconds: 2));
    print("Got data from cloud");
    return "fake data";
  }

  Future<String> _parseData({required String data}) async {
    await Future.delayed(Duration(seconds: 2));
    print("Parsed data");
    return "fake parsed data";
  }

  Future getData() async {
    // get data takes time
    final String dataFromCloud = await _getDataFromCloud();
    // parse data takes time
    final String parsedData = await _parseData(data: dataFromCloud);

    return parsedData;
  }

  Future getDataAlt() async {
    final String parsedData =
        await _getDataFromCloud().then((dataFromCloud) async {
      return await _parseData(data: dataFromCloud);
    });

    return parsedData;
  }
}
