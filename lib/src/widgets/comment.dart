import 'package:flutter/material.dart';
import '../models/item_model.dart';
import 'loading_container.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;
  final int depth;

  Comment({this.itemId, this.itemMap, this.depth});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        final item = snapshot.data;

        // ! if the title or subtitle are null, we need to disclude
        // ! that child from being built as a ListTile
        // ! Possible old record of a deleted comments coming from hacker news.

        final childrenList = <Widget>[
          ListTile(
            title: buildText(item),
            subtitle: item.by == '' ? Text('Deleted') : Text(item.by),
            contentPadding: EdgeInsets.only(
              left: (depth + 1) * 16.0,
              right: 16.0,
            ),
          ),
          Divider(
            indent: 10.0,
            endIndent: 10.0,
            thickness: 1.5,
          )
        ];

        item.kids.forEach((kidId) {
          // print(kidId);
          childrenList.add(
            Comment(itemId: kidId, itemMap: itemMap, depth: depth + 1),
          );
        });

        return Column(
          children: [
            ...childrenList,
          ],
        );
      },
    );
  }

  Widget buildText(ItemModel item) {
    final text = item.text
        .replaceAll('&#x27;', "'")
        .replaceAll('<p>', '\n\n')
        .replaceAll('</p>', '');

    return Text(text);
  }
}
