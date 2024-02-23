import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:solution/models/news_api_body.dart';
import "dart:convert";
import 'dart:math';

class WhatsNew {
  String? content;
  String? iconPath;
  String? url;

  WhatsNew({
    required this.content,
    required this.iconPath,
    required this.url,
  });

  static Future<List<WhatsNew>> getInfo() async {
    String endPoint = buildEndPoint();
    final responses = await fetch(endPoint);

    List<WhatsNew> info = [];

    for (var article in responses) {
      info.add(
        WhatsNew(
          content: article.title,
          iconPath: article.urlToImage,
          url: article.url,
        ),
      );
    }

    return info;
  }
}

String buildEndPoint() {

  String startDate = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 29)));

  String url = 'https://newsapi.org/v2/everything?';

  Map <String, dynamic> queryParams = {
    'q' : 'ASD',
    'from' : startDate,
    'sortBy' : 'relevancy',
    'apiKey' : '19ec8256cef94fae8102969661f055d7',
    'language' : 'en'
  };

  queryParams.forEach((key, value) {
    String query = '$key=$value';
    url = '$url$query&';
   });

  url = url.substring(0,url.length-1);
  return url;

}

Future<List<Article>> fetch(endPoint) async {
  List<Article> articles = [];
  final response = await http.get(Uri.parse(endPoint));

  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);

    if (responseData['status'] == 'ok') {
      var articlesData = responseData['articles'];

      // Shuffle the articles randomly
      articlesData.shuffle();

      // Take the first 5 articles (or less if there are fewer than 5)
      articlesData.take(5).forEach((article) {
        articles.add(
          Article(
            title: article['title'] ?? "No title available",
            description: article['description'] ?? "No description available",
            url: article['url'] ?? "No URL available",
            urlToImage: article['urlToImage'] ?? "No image URL available",
          ),
        );
      });
      return articles;
    } else {
      throw Exception('API returned an error: ${responseData['message']}');
    }
  } else {
    throw Exception('API not working');
  }
}