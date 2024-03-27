import 'package:flutter/material.dart';
import '/models/article.dart';

class ArticleController extends ChangeNotifier {
  ArticleController._();
  static final ArticleController _controller = ArticleController._();
  factory ArticleController() => _controller;

  void toggleArticle(Article article) {
    article.isFavorite = !article.isFavorite!;
    notifyListeners();
  }

}
