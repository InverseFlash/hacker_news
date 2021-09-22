import 'package:http/http.dart' show Client;
import 'dart:convert' show json;
import '../models/item_model.dart';
import 'repository.dart';

final _rootUrl = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider implements Source {
  var client = Client();

  @override
  Future<List<int>> fetchTopIds() async {
    var uri = Uri.parse('$_rootUrl/topstories.json');
    final response = await client.get(uri);
    final ids = json.decode(response.body);
    return ids.cast<int>();
  }

  @override
  Future<ItemModel> fetchItem(int id) async {
    var uri = Uri.parse('$_rootUrl/item/$id.json');
    final response = await client.get(uri);
    final parsedJson = json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}
