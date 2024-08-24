import '../Model/NewsArticle.dart';

class NewsRepository {

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
