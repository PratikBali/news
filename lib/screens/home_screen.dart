import 'dart:collection';

import '../widgets/news_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/news_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('News Flutters'),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  useSafeArea: true,
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return Consumer<NewsData>(
                      builder: (
                        context,
                        newsData,
                        child,
                      ) {
                        List<String> check = [];
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              TextField(
                                autofocus: true,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    for (String headline
                                        in newsData.newsTitleList) {
                                      if (value
                                          .toLowerCase()
                                          .contains(headline.toLowerCase())) {
                                        check.add(headline);
                                      }
                                    }
                                  });
                                },
                              ),
                              for (String headline in check)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    headline,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              for (String headline in newsData.newsTitleList)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    headline,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              // ListView.builder(
                              //   itemCount: newsData.newsArticlesCount,
                              //   itemBuilder: (context, index) {
                              //     String headlines =
                              //         newsData.newsTitleList[index];
                              //     return ListTile(
                              //       title: Text(headlines),
                              //     );
                              //   },
                              // ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
              icon: Icon(Icons.search),
            )
          ],
        ),
      ),
      body: Consumer<NewsData>(
        builder: (
          context,
          newsData,
          child,
        ) {
          return PageView.builder(
            controller: PageController(initialPage: 0),
            scrollDirection: Axis.vertical,
            itemCount: newsData.newsArticlesCount,
            itemBuilder: (context, index) {
              final newsDataAPI = newsData.news[index];
              return Center(
                child: NewsContainer(
                  imageURL: newsDataAPI.newsImage != null
                      ? newsDataAPI.newsImage
                      : 'Image Unavailable',
                  newsTitle: newsDataAPI.newsTitle,
                  newsDesc: newsDataAPI.newsDesc,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
