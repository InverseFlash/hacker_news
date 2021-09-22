import 'dart:async';

import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repository.dart';

class CommentsBloc {
  final _repository = Repository();
  final _commentsFetcher = PublishSubject<int>();
  final _commentsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();

  // Sink
  Function(int) get fetchItemWithComments => _commentsFetcher.sink.add;

  // Streams
  Stream<Map<int, Future<ItemModel>>> get itemWithComments =>
      _commentsOutput.stream;

  CommentsBloc() {
    _commentsFetcher.stream
        .transform(_commentsTransformer())
        .pipe(_commentsOutput);
  }

  ScanStreamTransformer<int, Map<int, Future<ItemModel>>>
      _commentsTransformer() {
    return ScanStreamTransformer<int, Map<int, Future<ItemModel>>>(
        (cache, int id, index) {
      cache[id] = _repository.fetchItem(id);
      cache[id].then((ItemModel item) =>
          item.kids.forEach((kidId) => fetchItemWithComments(kidId)));
      // print('index is: $index');
      // print('id is $id');
      return cache;
    }, <int, Future<ItemModel>>{});
  }

  void dispose() {
    _commentsFetcher.close();
    _commentsOutput.close();
  }
}
