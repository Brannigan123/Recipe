import 'package:flutter/material.dart';
import 'package:login_01/screens/components/favorite-badge.dart';
import 'package:login_01/screens/components/neumorphic.dart';

import 'components/recipe-list-small-preview.dart';
import 'components/searchbox.dart';
import 'components/section-title.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchBoxController = TextEditingController();
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _search(context),
        sectionTitle(context, "Top Searches"),
        Expanded(
          flex: 1,
          child: _popularRecipesSection(context),
        ),
        sectionTitle(
          context,
          _searchText.isEmpty ? 'Popular Recipes' : 'Recipe Results',
        ),
        Expanded(
          flex: 4,
          child: recipeListTiles(context),
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

  Widget _popularRecipesSection(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        direction: Axis.vertical,
        spacing: 8,
        runSpacing: 4,
        children: _popularRecipeChips(context),
      ),
    );
  }

  List<Widget> _popularRecipeChips(BuildContext context) {
    final list = <String>[
      'American',
      'German',
      'Greek',
      'Italian',
      'Thai',
      'Brazil',
      'Japanese',
      'Chinese'
    ];
    return list.map((e) => _popularRecipeChip(context, e)).toList();
  }

  Widget _popularRecipeChip(BuildContext context, String text) {
    return InputChip(
      backgroundColor: Colors.grey.shade200,
      label: Text(
        text,
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        setState(() {
          _searchText = text;
          _searchBoxController.text = text;
        });
      },
    );
  }
}
