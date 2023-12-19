import '../widgets/news_content.dart';
import 'package:flutter/material.dart';

class NewsContentScreen extends StatelessWidget {
  String newsTitle;
  String newsDesc;

  NewsContentScreen({
    required this.newsTitle,
    required this.newsDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Flutters'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: NewsContent(
                newsTitle: newsTitle,
                newsDesc: newsDesc,
              ),
            ),
          );
        },
      ),
    );
  }
}
