import 'package:flutter/material.dart';
import 'package:news_app2/controller/article_controller.dart';
import '/models/article.dart';

class NewsDetails extends StatefulWidget {
  final Article article;
  final GlobalKey<FormState> formKey;
  const NewsDetails({super.key, required this.formKey, required this.article});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  final controller = ArticleController();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (BuildContext context, Widget? child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Details',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(
                    widget.article.isFavorite!
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      controller.toggleArticle(widget.article);
                    });
                  },
                ),
              ],
              backgroundColor: Colors.white,
            ),
            body: confirmNews(widget.article),
          );
        });
  }
}

Widget confirmNews(Article article) {
  return Stack(
    children: [
      ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    article.urlToImage!,
                    width: 350,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.person),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      article.author!,
                    ),
                  ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.calendar_month),
                  Text(DateTime.parse(article.publishedAt).toString()),
                ],
              ),
              Text(
                article.content!,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ]),
          ),
        ],
      ),
    ],
  );
}

Widget buildListView(GlobalKey<FormState> formKey, List<Article> list) {
  return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        if (list.isEmpty) {
          return const SingleChildScrollView();
        } else {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetails(
                      formKey: formKey,
                      article: list.elementAt(index),
                    ),
                  ));
            },
            child: Card(
              elevation: 2.0,
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.network(
                      list.elementAt(index).urlToImage ?? '',
                      width: 95,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.blue,
                          width: 95,
                          height: 100,
                        );
                      },
                    ),
                    const SizedBox(
                      width: 3.0,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list.elementAt(index).title,
                              style: const TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.person),
                                Expanded(
                                    child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    list.elementAt(index).author!,
                                  ),
                                ))
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.calendar_month),
                                Text(list.elementAt(index).publishedAt),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      });
}
