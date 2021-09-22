import 'package:news/src/resources/news_api_provider.dart';
import 'dart:convert' show json;
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('fetchTopIds returns a list of ids', () async {
    final newsApi = NewsApiProvider();
    final expected = [1, 2, 3, 4];

    // newsApi.client = MockClient((request) async {
    //   return Response(json.encode(expected), 200);
    // });

    final ids = await newsApi.fetchTopIds();

    // expect(ids, expected);
  });

  test('fetchItem returns an ItemModel', () async {
    final newsApi = NewsApiProvider();
    final expected = {'id': 123};

    newsApi.client = MockClient((request) async {
      return Response(json.encode(expected), 200);
    });

    final item = await newsApi.fetchItem(999);

    expect(item.id, 123);
  });
}
