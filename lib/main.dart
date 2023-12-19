import '../models/news_data.dart';
import '../screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const NewsFlutters());
}

class NewsFlutters extends StatelessWidget {
  const NewsFlutters({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsData(),
      child: MaterialApp(
        home: LoadingScreen(),
      ),
    );
  }
}
