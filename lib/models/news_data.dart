import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'news_model.dart';

class NewsData extends ChangeNotifier {
  List<NewsModel> _news = [];
  List<String> _newsTitleList = [];

  UnmodifiableListView<NewsModel> get news {
    return UnmodifiableListView(_news);
  }

  UnmodifiableListView<String> get newsTitleList {
    return UnmodifiableListView(_newsTitleList);
  }

  void addAPIData(var newsData) {
    final data = newsData;
    for (int i = 0; i < 10; i++) {
      String newsTitle = data['results'][i]['title'];
      String newsDesc = data['results'][i]['content'];
      String newsImage = data['results'][i]['image_url'] != null
          ? data['results'][i]['image_url']
          : 'images/pm.jfif';
      _news.add(NewsModel(
          newsTitle: newsTitle, newsDesc: newsDesc, newsImage: newsImage));
      _newsTitleList.add(newsTitle);
    }
    notifyListeners();
  }

  int get newsArticlesCount {
    return _news.length;
  }
}
