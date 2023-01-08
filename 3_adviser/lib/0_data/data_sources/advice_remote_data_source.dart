import 'dart:convert';
import 'package:adviser/0_data/exceptions/exceptions.dart';
import 'package:adviser/0_data/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDataSource {
  /// request random advice from API
  /// returns [AdviceModel] if successful
  /// throws a server-Exception if the status cost is not 200
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDataSourceImp implements AdviceRemoteDataSource {
  final http.Client client;
  AdviceRemoteDataSourceImp({required this.client});

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    const url = 'https://api.flutter-community.com/api/v1/advice';
    // const urlPath = 'https://api.flutter-community.com';
    // const callPath = 'api/v1/advice';
    // final uri = Uri.https(urlPath, callPath);
    final response = await client.get(
      Uri.parse(url),
      headers: {'content-type': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody);
    }
  }
}
