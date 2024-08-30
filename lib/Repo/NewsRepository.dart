import 'dart:convert';

import '../Model/NewsArticle.dart';
import 'package:http/http.dart' as http;

class NewsRepository {

  final String _apiKey = 'deaf9ec778224c868a2e0e977d751a44';
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines';

  Future<List<NewsArticle>> fetchTopHeadlines({String country = 'us'}) async {
    final response = await http.get(Uri.parse('$_baseUrl?country=$country&apiKey=$_apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data['articles'] as List).map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<List<NewsArticle>> fetchNews() async {
    List<NewsArticle> articles = [];

    for (int i = 1; i <= 10; i++) {
      articles.add(NewsArticle(
        title: 'Fake News Title $i',
        description: 'This is a fake description for news article number $i. It contains random content for testing purposes.',
        urlToImage: 'https://fastly.picsum.photos/id/870/200/300.jpg?blur=2&grayscale&hmac=ujRymp644uYVjdKJM7kyLDSsrqNSMVRPnGU99cKl6Vs',
      ));
    }

    return articles;
  }
}
