import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_application/data/model/article.dart';
import 'package:new_application/provider/news_provider.dart';
import 'package:new_application/ui/home_page.dart';
import 'package:new_application/ui/article_detail_page.dart';
import 'package:new_application/widgets/platform_widget.dart';
import 'package:new_application/widgets/card_article.dart';
import 'package:new_application/data/api/api_service.dart';
import 'package:new_application/provider/news_provider.dart';
import 'package:provider/provider.dart';

class ArticleListPage extends StatelessWidget {
  const ArticleListPage({Key key}) : super(key: key);

  Widget _buildList() {
    return Consumer<NewsProvider>(builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.hasData) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.result.articles.length,
          itemBuilder: (context, index) {
            var article = state.result.articles[index];
            return CardArticle(article: article);
          },
        );
      } else if (state.state == ResultState.noData) {
        return Center(child: Text(state.message));
      } else if (state.state == ResultState.error) {
        return Center(child: Text(state.message));
      } else {
        return Center(child: Text(''));
      }
    });
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: _buildList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('News App'),
        transitionBetweenRoutes: false,
      ),
      child: _buildList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
