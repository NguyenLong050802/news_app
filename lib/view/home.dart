import 'package:flutter/material.dart';
import '/models/article_models.dart';
import '/models/article.dart';
import 'news_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Article> articles = [];
  List<Article> searchResults = [];
  final searchCtl = TextEditingController();
  final model = ArticleModels();

  final formKey = GlobalKey<FormState>();

  void searchNews(String text) {
    searchResults = articles.where((articles) {
      var pop = articles.title.toLowerCase();
      return pop.contains(text);
    }).toList();
  }

  @override
  void initState() {
    model.getArtiles().then(
      (value) {
        searchResults = value;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: searchCtl,
              onChanged: (text) {
                text = text.toLowerCase();
                setState(() {
                  searchNews(text);
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: InkWell(
                  child: const Icon(Icons.close),
                  onTap: () {
                    setState(() {
                      searchCtl.clear();
                      searchNews(searchCtl.text);
                    });
                  },
                ),
                hintText: 'Search...',
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black)),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: model.getArtiles(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.done:
                        articles = snapshot.data ?? [];
                        return buildListView(formKey, searchResults);
                    }
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Lỗi: ${snapshot.error}"),
                    );
                  } else {
                    return const Center(child: LinearProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
