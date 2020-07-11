import 'dart:math';

import 'package:flutter/material.dart';
import 'components/section-title.dart';
import 'components/neumorphic.dart';
import 'components/searchbox.dart';

class MyRecipesPage extends StatefulWidget {
  MyRecipesPage({Key key}) : super(key: key);

  @override
  _MyRecipesPageState createState() => _MyRecipesPageState();
}

class _MyRecipesPageState extends State<MyRecipesPage> {
  TextEditingController _searchBoxController = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _search(),
        sectionTitle(context, 'Actions'),
        _uploadOptions(context),
        sectionTitle(context, 'My Recipes'),
        _noRecipePlaceHolder(context),
      ],
    );
  }

  Widget _search() {
    return convex(
      context,
      margin: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: SearchBox(
        controller: _searchBoxController,
        onChanged: (text) {
          setState(() {
            _searchText = text;
          });
        },
      ),
    );
  }

  Widget _uploadOptions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _uploadVideoAction(context),
        ),
        Expanded(
          flex: 1,
          child: _uploadArticleAction(context),
        ),
      ],
    );
  }

  Widget _uploadVideoAction(BuildContext context) {
    return ClickContainer(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      bevel: 2,
      child: Container(
        height: MediaQuery.of(context).size.width / 3,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Icon(
                Icons.video_library,
                size: 32,
                color: Theme.of(context).accentColor,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'Create a recipe video',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _uploadArticleAction(BuildContext context) {
    return ClickContainer(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      bevel: 2,
      child: Container(
        height: MediaQuery.of(context).size.width / 3,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Icon(
                Icons.library_books,
                size: 32,
                color: Theme.of(context).accentColor,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'Create a recipe article',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _noRecipePlaceHolder(BuildContext context) {
    Size viewSize = MediaQuery.of(context).size;
    double size = min(viewSize.height, viewSize.width) / 3;
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.list,
              size: size,
              color: Colors.black12,
            ),
            Text(
              'You have not created any recipe content yet',
              style: TextStyle(
                color: Colors.black38,
              ),
            )
          ],
        ),
      ),
    );
  }
}
