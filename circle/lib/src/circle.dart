import 'package:flutter/widgets.dart';

class Circle extends StatelessWidget {
  Color? color;
  double? radius;

  Circle({required this.color, required this.radius});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
