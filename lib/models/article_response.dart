// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'article.dart';

class ArticleResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;
  ArticleResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  ArticleResponse copyWith({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) {
    return ArticleResponse(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((x) => x.toMap()).toList(),
    };
  }

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    var list = json['articles'] as List;
    List<Article> articleList = list.map((i) => Article.fromJson(i)).toList();

    return ArticleResponse(
      status: json['status'] ?? '',
      totalResults: json['totalResults'] ?? 0,
      articles: articleList,
    );
  }

  @override
  String toString() =>
      'ArticleResponse(status: $status, totalResults: $totalResults, articles: $articles)';
}
