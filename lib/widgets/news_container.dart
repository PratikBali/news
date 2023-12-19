import '../screens/news_content_screen.dart';
import '../widgets/news_content.dart';
import 'package:flutter/material.dart';

class NewsContainer extends StatelessWidget {
  String imageURL;
  String newsTitle;
  String newsDesc;

  NewsContainer({
    required this.imageURL,
    required this.newsTitle,
    required this.newsDesc,
  });

  String trimContent(String content) {
    if (content.length > 700) {
      return content.substring(0, 700) + '...';
    } else {
      return content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageURL,
            height: 200,
            width: 400,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset(
                'images/pm.jfif',
                height: 200,
                width: 400,
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Text(
              newsTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Text(trimContent(newsDesc)),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NewsContentScreen(
                            newsTitle: newsTitle,
                            newsDesc: newsDesc,
                          );
                        },
                      ),
                    );
                  },
                  child: Text('Read more'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
