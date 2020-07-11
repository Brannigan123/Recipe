import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_01/screens/highlights-screen.dart';
import 'package:login_01/screens/liked-recipes-screen.dart';
import 'package:login_01/screens/my-recipes-screen.dart';
import 'package:login_01/screens/routes/routes.dart';
import 'package:login_01/screens/search-screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _bottomNavigationKey = GlobalKey();
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _page);
    _pageController.addListener(() {
      int currentPage = _pageController.page.round();
      print(currentPage);
      if (_page != currentPage) {
        _page = currentPage;
        final CurvedNavigationBarState navBarState =
            _bottomNavigationKey.currentState;
        navBarState.setPage(_page);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: PageView(
            controller: _pageController,
            children: [
              HighlightsScreen(),
              SearchPage(),
              MyRecipesPage(),
              LikedRecipesPage(),
              Container(),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          color: Theme.of(context).accentColor,
          items: <Widget>[
            Icon(Icons.list,
                size: 28, color: Theme.of(context).scaffoldBackgroundColor),
            Icon(Icons.search,
                size: 28, color: Theme.of(context).scaffoldBackgroundColor),
            Icon(Icons.add,
                size: 28, color: Theme.of(context).scaffoldBackgroundColor),
            Icon(Icons.favorite_border,
                size: 28, color: Theme.of(context).scaffoldBackgroundColor),
            Icon(Icons.person_outline,
                size: 28, color: Theme.of(context).scaffoldBackgroundColor),
          ],
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 150),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
    );
  }
}
