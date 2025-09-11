import 'dart:convert';

import 'package:flutter_tech_task/data/service/api_service.dart';
import 'package:flutter_tech_task/utils/app_exceptions.dart';
import 'package:flutter_tech_task/utils/result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late ApiService apiService;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    apiService = ApiService(client: mockHttpClient);
    registerFallbackValue(Uri.parse('https://example.com'));
  });

  testWidgets('successful api get request', (tester) async {
    final responseBody = jsonEncode({'key': 'value'});

    when(
      () => mockHttpClient.get(any(), headers: any(named: 'headers')),
    ).thenAnswer((_) async => http.Response(responseBody, 200));

    Result<dynamic> result = await apiService.get(endpoint: '/test-endpoint');
    expect(result, Result.ok(jsonDecode(responseBody)));
  });

  test('bad request error ',
    () async {
      final responseBody = jsonEncode([]);

      when(
        () => mockHttpClient.get(any(), headers: any(named: 'headers')),
      ).thenAnswer((_) async => http.Response(responseBody, 400));
      var result = await apiService.get(endpoint: '/test-endpoint');
      expect(result, Result.error(BadRequestException()));
    },
  );
}
