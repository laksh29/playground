import 'package:flutter/material.dart';
import 'package:playground/news_articles/article_detail_screen.dart';
import 'package:playground/news_articles/news_article_data.dart';

enum UriSource {
  homeWidget,
  inApp,
}

class PlaygroundUriHandler {
  PlaygroundUriHandler();
  late GlobalKey<NavigatorState> navKey;

  static void init({required GlobalKey<NavigatorState> navKey}) {
    navKey = navKey;
  }

  void launch({
    Uri? uri,
    UriSource source = UriSource.inApp,
  }) {
    switch (source) {
      case UriSource.homeWidget:
        final id = uri?.queryParameters['id'];

        if (id == null || id.isEmpty) return; // just open the app normally
        final matches = NewsArticle.getNewsStories.where((a) => a.id == id);
        if (matches.isEmpty) return;
        navKey.currentState?.push(
          MaterialPageRoute<Widget>(
            builder: (_) => ArticleDetailScreen(article: matches.first),
          ),
        );
        break;
      default:
    }
  }
}
