import 'package:flutter/material.dart';

class FavBadge extends StatefulWidget {
  final int count;
  final bool myfav;
  final void Function(int, bool) onSwitch;

  FavBadge({Key key, this.count = 0, this.myfav = false, this.onSwitch})
      : super(key: key);

  @override
  _FavBadgeState createState() => _FavBadgeState(count, myfav, onSwitch);
}

class _FavBadgeState extends State<FavBadge> {
  int count;
  bool myfav;
  final void Function(int, bool) onSwitch;

  _FavBadgeState(this.count, this.myfav, this.onSwitch);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInCubic,
      child: InputChip(
        avatar: Icon(
          Icons.favorite_border,
          color: myfav ? Theme.of(context).backgroundColor : Colors.grey,
        ),
        label: Text(
          '$count',
          style: TextStyle(
            color: myfav ? Theme.of(context).backgroundColor : Colors.grey,
          ),
        ),
        backgroundColor: myfav
            ? Theme.of(context).accentColor
            : Theme.of(context).chipTheme.backgroundColor,
        onPressed: () {
          setState(() {
            myfav = !myfav;
            count = myfav ? count + 1 : count - 1;
          });
          onSwitch?.call(count, myfav);
        },
      ),
    );
  }
}
