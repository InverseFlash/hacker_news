import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        deleted = parsedJson['deleted'] ?? false,
        type = parsedJson['type'],
        by = parsedJson['by'] ?? '',
        time = parsedJson['time'],
        text = parsedJson['text'] ?? '',
        dead = parsedJson['dead'] ?? false,
        parent = parsedJson['parent'],
        kids = parsedJson['kids'] ?? [],
        url = parsedJson['url'],
        score = parsedJson['score'],
        title = parsedJson['title'],
        descendants = parsedJson['descendants'] ?? 0;

  ItemModel.fromDb(Map<String, dynamic> mappedItem)
      : id = mappedItem['id'],
        deleted = mappedItem['deleted'] == 1,
        type = mappedItem['type'],
        by = mappedItem['by'],
        time = mappedItem['time'],
        text = mappedItem['text'],
        dead = mappedItem['dead'] == 1,
        parent = mappedItem['parent'],
        kids = jsonDecode(mappedItem['kids']),
        url = mappedItem['url'],
        score = mappedItem['score'],
        title = mappedItem['title'],
        descendants = mappedItem['descendants'];

  Map<String, dynamic> toMapForDb() {
    return {
      'id': id,
      'deleted': deleted != null ? 1 : 0,
      'type': type,
      'by': by,
      'time': time,
      'text': text,
      'dead': dead != null ? 1 : 0,
      'parent': parent,
      'kids': jsonEncode(kids),
      'url': url,
      'score': score,
      'title': title,
      'descendants': descendants,
    };
  }
}
