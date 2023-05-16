import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:new_application/widgets/custom_scaffold.dart';

class ArticleWebView extends StatelessWidget {
  static const routeName = '/article_view';

  final String url;

  const ArticleWebView({ this.url});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}