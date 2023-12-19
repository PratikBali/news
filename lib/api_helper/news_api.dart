import 'package:http/http.dart';
import 'dart:convert';

const apiKey = 'pub_3346217ab23ac5ca9748a428f6a18100fed81';

class NewsAPI {
  Future getData() async {
    Response response = await get(
      Uri.https(
        'newsdata.io',
        'api/1/news',
        {
          'country': 'us',
          'apikey': '$apiKey',
        },
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
