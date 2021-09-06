import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {Key? key,
      required this.titleText,
      required this.sizeHeight,
      required this.sizeWidth,
      required this.color})
      : super(key: key);

  String titleText;
  double sizeHeight;
  double sizeWidth;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeHeight,
      width: sizeWidth,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Center(
        child: Text(
          titleText,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
