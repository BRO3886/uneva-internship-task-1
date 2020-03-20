import 'package:flutter/material.dart';

class SmallCircle extends StatelessWidget {
  final Color color;
  SmallCircle(this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
