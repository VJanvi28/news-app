import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'news_model.dart';

class NewsService with ChangeNotifier {
  List<Article> articles = [];

  Future<void> fetchNews() async {
    const apiKey = 'your_newsapi_key';
    final url ='https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List articlesJson = data['articles'];
      articles = articlesJson.map((json) => Article.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
