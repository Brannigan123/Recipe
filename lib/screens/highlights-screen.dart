import 'package:flutter/material.dart';
import 'package:login_01/screens/components/recipe-list-large-preview.dart';
import 'package:login_01/screens/components/section-title.dart';

import 'components/favorite-badge.dart';
import 'components/neumorphic.dart';

class HighlightsScreen extends StatefulWidget {
  HighlightsScreen({Key key}) : super(key: key);

  @override
  _HighlightsScreenState createState() => _HighlightsScreenState();
}

class _HighlightsScreenState extends State<HighlightsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sectionTitle(
          context,
          'Categories',
          trailing: [
            InkWell(
              onTap: () {},
              child: Text(
                'view all...',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: MediaQuery.of(context).size.width,
          height: 72,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 12,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://source.unsplash.com/96x72/?cuisine $index',
                        width: 96,
                        height: 72,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Text(
                        'Category $index',
                        style: TextStyle(
                          color: Theme.of(context).cardColor,
                          backgroundColor: Colors.grey.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        sectionTitle(context, "Suggestions"),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: recipeListLargePreview(context),
          ),
        ),
      ],
    );
  }
}
