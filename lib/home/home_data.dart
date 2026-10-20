import 'package:flutter/material.dart';
import 'package:playground/news_articles/news_listing_screen.dart';

class HomeData {
  final String title;
  final Widget screen;
  final String? subTitle;

  HomeData({
    required this.title,
    required this.screen,
    this.subTitle,
  });

  static List<HomeData> items = [
    HomeData(
      title: "News Articles",
      subTitle: "Device home widget experiment",
      screen: NewsListingScreen(),
    ),
  ];
}
