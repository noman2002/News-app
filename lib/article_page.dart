import 'dart:async';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:news_app/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({
    Key? key,
    required this.articleUrl,
  }) : super(key: key);

  final String articleUrl;

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News India",
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.articleUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
