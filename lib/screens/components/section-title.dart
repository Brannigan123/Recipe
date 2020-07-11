import 'package:flutter/material.dart';

Widget sectionTitle(BuildContext context, String text,
    {List<Widget> trailing = const []}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]..addAll(trailing),
    ),
  );
}
