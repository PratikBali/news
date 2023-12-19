import 'package:flutter/material.dart';

class NewsContent extends StatelessWidget {
  String newsTitle;
  String newsDesc;

  NewsContent({
    required this.newsTitle,
    required this.newsDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            newsTitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(newsDesc),
        ],
      ),
    );
  }
}
