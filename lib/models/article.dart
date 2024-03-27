// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'source.dart';

class Article {
  Source? source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  String publishedAt;
  String? content;
  bool? isFavorite;
  Article({
    this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
    this.isFavorite,
  });

  Article copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
    bool? isFavorite,
  }) {
    return Article(
      source: source ?? this.source,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source?.toMap(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
      'isFavorite': isFavorite,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      source: map['source'] != null ? Source.fromMap(map['source'] as Map<String,dynamic>) : null,
      author: map['author'] != null ? map['author'] as String : null,
      title: map['title'] as String,
      description: map['description'] != null ? map['description'] as String : null,
      url: map['url'] as String,
      urlToImage: map['urlToImage'] != null ? map['urlToImage'] as String : null,
      publishedAt: map['publishedAt'] as String,
      content: map['content'] != null ? map['content'] as String : null,
      isFavorite: map['isFavorite'] != null ? map['isFavorite'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) => Article.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Article(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(covariant Article other) {
    if (identical(this, other)) return true;
  
    return 
      other.source == source &&
      other.author == author &&
      other.title == title &&
      other.description == description &&
      other.url == url &&
      other.urlToImage == urlToImage &&
      other.publishedAt == publishedAt &&
      other.content == content &&
      other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return source.hashCode ^
      author.hashCode ^
      title.hashCode ^
      description.hashCode ^
      url.hashCode ^
      urlToImage.hashCode ^
      publishedAt.hashCode ^
      content.hashCode ^
      isFavorite.hashCode;
  }
}
