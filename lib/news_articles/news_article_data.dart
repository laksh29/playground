class NewsArticle {
  final String id;
  final String title;
  final String description;
  final String? articleText;
  final String? image;

  NewsArticle({
    required this.id,
    required this.title,
    required this.description,
    this.articleText = loremIpsum,
    this.image,
  });

  static const String loremIpsum =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';

  static List<NewsArticle> getNewsStories = [
    NewsArticle(
      id: 'DAU',
      title: 'Flutter DAU surpasses 10 billion',
      description: 'There are more Flutter users than there are human beings. What gives?',
    ),
    NewsArticle(
      id: 'FLUTTER-FORWARD',
      title: 'Remembering Flutter Forward',
      description: 'Flutter Forward took place in Nairobi, Kenya in January 2023',
    ),
    NewsArticle(
      id: 'COMMUNITY',
      title: 'Flutter Community saves world',
      description: "They're just that nice",
    ),
    NewsArticle(
      id: 'DAU-2',
      title: 'Flutter DAU surpasses 10 billion',
      description: 'There are more Flutter users than there are human beings. What gives?',
    ),
  ];
}
