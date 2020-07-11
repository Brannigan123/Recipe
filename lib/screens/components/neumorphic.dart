import 'package:flutter/material.dart';

Widget convex(
  BuildContext context, {
  @required Widget child,
  EdgeInsetsGeometry padding = const EdgeInsets.all(0),
  EdgeInsetsGeometry margin = const EdgeInsets.all(4),
  double bevel = 10.0,
}) {
  final color = Theme.of(context).backgroundColor;
  final blurOffset = Offset(bevel / 2, bevel / 2);

  return Container(
    padding: padding,
    margin: margin,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(bevel * 10),
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.mix(Colors.grey, .1),
            color,
            color,
            color.mix(Colors.white, .4),
          ],
          stops: [
            0.0,
            0.3,
            0.6,
            1.0,
          ]),
      boxShadow: [
        BoxShadow(
          blurRadius: bevel,
          offset: -blurOffset,
          color: color.mix(Colors.white, .6),
        ),
        BoxShadow(
          blurRadius: bevel,
          offset: blurOffset,
          color: color.mix(Colors.black, .3),
        )
      ],
    ),
    child: child,
  );
}

Widget concave(
  BuildContext context, {
  @required Widget child,
  EdgeInsetsGeometry padding = const EdgeInsets.all(0),
  EdgeInsetsGeometry margin = const EdgeInsets.all(4),
  double bevel = 10.0,
}) {
  final color = Theme.of(context).backgroundColor;

  return Container(
    padding: padding,
    margin: margin,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(bevel * 10),
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.mix(Colors.grey, .1),
            color,
            color.mix(Colors.white, .3),
          ],
          stops: [
            0.1,
            0.5,
            0.9,
          ]),
    ),
    child: child,
  );
}

class ClickContainer extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double bevel;
  final void Function() onClick;

  ClickContainer(
      {@required this.child,
      this.padding = const EdgeInsets.all(0),
      this.margin = const EdgeInsets.all(4),
      this.bevel = 10.0,
      this.onClick});
  @override
  _ClickContainerState createState() =>
      _ClickContainerState(child, padding, margin, bevel, onClick);
}

class _ClickContainerState extends State<ClickContainer> {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double bevel;
  final void Function() onClick;

  bool isPressed = false;

  _ClickContainerState(
      this.child, this.padding, this.margin, this.bevel, this.onClick);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick?.call();
      },
      onTapDown: ($) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: ($) {
        setState(() {
          isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInCubic,
        padding: padding,
        margin: margin,
        child: isPressed
            ? concave(
                context,
                padding: padding,
                margin: margin,
                bevel: bevel,
                child: child,
              )
            : convex(
                context,
                padding: padding,
                margin: margin,
                bevel: bevel,
                child: child,
              ),
      ),
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}
