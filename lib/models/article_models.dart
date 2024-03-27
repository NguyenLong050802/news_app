import 'dart:convert';
import 'article.dart';
import 'package:http/http.dart' as http;

class ArticleModels {
  ArticleModels._();
  static final ArticleModels _models = ArticleModels._();
  factory ArticleModels() => _models;

  Future<List<Article>> getArtiles() async {
    const url =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=fb36aad16bcd4362916ceab20e705655';
    List<Article> articles = [];
    final response = await http.get(Uri.parse(url));

    final body = jsonDecode(response.body) as Map<String, dynamic>;
    for (final item in body['articles']) {
      articles.add(Article.fromMap(item));
    }
    for (int i = 0; i < articles.length; i++) {
      if (articles.elementAt(i).urlToImage == null) {
        articles.elementAt(i).urlToImage =
            "https://icon-library.com/images/image-error-icon/image-error-icon-5.jpg";
      }
      if (articles.elementAt(i).author == null) {
        articles.elementAt(i).author = " ";
      }
      if (articles.elementAt(i).content == null) {
        articles.elementAt(i).content = " ";
      }
      if (articles.elementAt(i).description == null) {
        articles.elementAt(i).description = " ";
      }
      if (articles.elementAt(i).isFavorite == null) {
        articles.elementAt(i).isFavorite = false;
      }
    }
    return articles;
  }

}
