import 'package:flutter/material.dart';
import 'package:news_app/article_model.dart';
import 'package:news_app/news.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NewsApp",
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return NewsCard(
                      imageUrl: articles[index].urlToImage ?? "",
                      title: articles[index].title ?? "",
                      desc: articles[index].description ?? "",
                    );
                  },
                ),
              ),
            ),
    );
  }
}

class NewsCard extends StatelessWidget {
  NewsCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.desc,
  }) : super(key: key);

  final String imageUrl, title, desc;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[50],
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(imageUrl),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        // subtitle: Text(
        //   desc,
        //   style: TextStyle(
        //     color: Colors.black54,
        //   ),
        // ),
      ),
    );
  }
}
