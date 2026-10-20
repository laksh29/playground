import 'package:flutter/material.dart';
import 'package:playground/news_articles/article_detail_screen.dart';
import 'package:playground/news_articles/news_article_data.dart';

class NewsListingScreen extends StatefulWidget {
  const NewsListingScreen({super.key});
  @override
  State<NewsListingScreen> createState() => _NewsListingScreenState();
}

class _NewsListingScreenState extends State<NewsListingScreen> {
  final List<NewsArticle> newsStories = NewsArticle.getNewsStories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Stories'),
        centerTitle: false,
        titleTextStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, idx) {
          return const Divider();
        },
        itemCount: newsStories.length,
        itemBuilder: (context, idx) {
          final article = newsStories[idx];
          return ListTile(
            key: Key('$idx ${article.hashCode}'),
            title: Text(article.title),
            subtitle: Text(article.description),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<ArticleDetailScreen>(
                  builder: (context) {
                    return ArticleDetailScreen(article: article);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
