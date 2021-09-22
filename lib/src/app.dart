import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_provider.dart';
import './screens/news_list.dart';
import './screens/news_detail.dart';
import 'blocs/comments_provider.dart';
import 'blocs/stories_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return CommentsProvider(
      child: StoriesProvider(
        child: MaterialApp(
          title: 'News!',
          // home: NewsList(),
          onGenerateRoute: routes,
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    return settings.name == '/'
        ? MaterialPageRoute(
            builder: (context) {
              final storiesBloc = StoriesProvider.of(context);
              storiesBloc.fetchTopIds();
              return NewsList();
            },
          )
        : MaterialPageRoute(
            builder: (context) {
              final commentsBloc = CommentsProvider.of(context);
              var itemId = int.parse(settings.name.replaceFirst('/', ''));
              commentsBloc.fetchItemWithComments(itemId);

              return NewsDetail(itemId: itemId);
            },
          );
  }
}
