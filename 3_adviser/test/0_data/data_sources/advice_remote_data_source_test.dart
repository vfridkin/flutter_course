import 'package:adviser/0_data/data_sources/advice_remote_data_source.dart';
import 'package:adviser/0_data/models/advice_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart';
import 'advice_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  group('AdviceRemoteDataSource', () {
    group('Should return AdviceModel', () {
      test('When Client response was 200 and has valid data', () async {
        final mockClient = MockClient();

        final adviceRemoteDataSourceUnderTest =
            AdviceRemoteDataSourceImp(client: mockClient);

        final responseBody = '{"advice": "test advice", "advice_id" : 1}';
        when(mockClient.get(
          Uri.parse('https://api.flutter-community.com/api/v1/advice'),
          headers: {'content-type': 'application/json'},
        )).thenAnswer(
            (realInvocation) => Future.value(Response(responseBody, 200)));

        final result =
            await adviceRemoteDataSourceUnderTest.getRandomAdviceFromApi();

        expect(
            result,
            AdviceModel(
              id: 1,
              advice: 'test advice',
            ));
      });
    });
  });
}
