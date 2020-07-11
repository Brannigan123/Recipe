import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Iterable<String> autofillHints;
  final TextEditingController controller;

  const SearchBox({
    Key key,
    this.onChanged,
    this.autofillHints,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        autofillHints: autofillHints,
        controller: controller ?? TextEditingController(),
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search),
          hintText: "Search...",
          hintStyle: TextStyle(
            color: Theme.of(context).accentColor.withOpacity(0.5),
          ),
        ),
        style: TextStyle(
          color: Theme.of(context).accentColor.withOpacity(0.9),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
