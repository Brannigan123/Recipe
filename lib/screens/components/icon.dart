import 'package:flutter/material.dart';

class AppIcon extends StatefulWidget {
  AppIcon({Key key}) : super(key: key);

  @override
  _AppIconState createState() => _AppIconState();
}

class _AppIconState extends State<AppIcon> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Wes',
        style: TextStyle(color: Theme.of(context).cardColor, fontSize: 48),
        children: <TextSpan>[
          TextSpan(
            text: '@',
            style: TextStyle(color: Colors.orange, fontSize: 48),
          )
        ],
      ),
    );
  }
}
