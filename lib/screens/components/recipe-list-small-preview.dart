import 'package:flutter/material.dart';

import 'favorite-badge.dart';
import 'neumorphic.dart';

Widget recipeListTiles(BuildContext context) {
  return ListView.builder(
    padding: EdgeInsets.symmetric(horizontal: 8.0),
    itemCount: 100,
    itemBuilder: (context, index) {
      return convex(
        context,
        bevel: 1.0,
        child: Container(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://source.unsplash.com/96x96/? meal $index',
                width: 72,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              'Recipe $index',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'gfh hgi ghfuhj s hdh fjf fjdnckbg ghdjkjk',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            trailing: FavBadge(
              count: 100,
            ),
            isThreeLine: true,
          ),
        ),
      );
    },
  );
}
