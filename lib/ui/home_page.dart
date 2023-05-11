import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_application/ui/article_list_page.dart';
import 'package:new_application/ui/setting_page.dart';
import 'package:new_application/widgets/platform_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomNavIndex = 0;
  static const String _headlineText = 'Headline';

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: bottomNavIndex == 0
        ? ArticleListPage()
        : Placeholder(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.public),
              label: "Headline",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
            ),
          ],
          onTap: (selected) {
            setState(() {
              bottomNavIndex = selected;
            });
          },
        ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.news),
              label: 'Headline',
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return ArticleListPage();
          case 1:
            return Placeholder();
          default:
            return null;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidgetUI(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

}