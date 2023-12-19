import '../models/news_data.dart';
import '../screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../api_helper/news_api.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<dynamic> getNewsData() async {
    NewsAPI newsData = NewsAPI();
    var decodedData = await newsData.getData();
    // var f = [];
    // f = decodedData['results'];
    // var b = f.length;
    // print('Me $b');
    return decodedData;
  }

  void getData() async {
    var newsData = await getNewsData();
    Provider.of<NewsData>(context, listen: false).addAPIData(newsData);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomeScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Flutters'),
      ),
      body: Center(
        child: SpinKitDualRing(
          color: Colors.blueAccent,
          size: 100.0,
        ),
      ),
    );
  }
}
