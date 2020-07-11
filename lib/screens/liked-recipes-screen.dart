import 'package:flutter/material.dart';

import 'components/neumorphic.dart';
import 'components/recipe-list-large-preview.dart';
import 'components/searchbox.dart';
import 'components/section-title.dart';

class LikedRecipesPage extends StatefulWidget {
  LikedRecipesPage({Key key}) : super(key: key);

  @override
  _LikedRecipesPageState createState() => _LikedRecipesPageState();
}

class _LikedRecipesPageState extends State<LikedRecipesPage> {
  final _searchBoxController = TextEditingController();
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sectionTitle(context, "Recipes I Liked"),
        _search(context),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: recipeListLargePreview(context),
          ),
        ),
      ],
    );
  }

  Widget _search(BuildContext context) {
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
}
