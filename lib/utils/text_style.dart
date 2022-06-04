import 'package:flutter/material.dart';
import 'utils.dart';

class TxtStyle {
  static const heading1 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 30, height: 1.2);

  static const heading1SemiBold = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 30,
  );
  static const heading1Medium = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 30,
    height: 1.2,
  );

  static const heading2 = TextStyle(
      fontFamily: 'montserrat',
      fontWeight: FontWeight.w500,
      fontSize: 22,
      height: 1.2,
      decoration: TextDecoration.none,
      color: DarkTheme.white);

  static const heading3 =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 20, height: 1.2);

  static const heading3Medium = TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 20,
      height: 1.2,
      decoration: TextDecoration.none,
      color: DarkTheme.white);

  static const heading3Light = TextStyle(
      fontWeight: FontWeight.w200,
      fontSize: 20,
      height: 1.2,
      color: DarkTheme.white,
      decoration: TextDecoration.none);

  static const heading4 = TextStyle(
      fontFamily: 'montserrat',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.6,
      decoration: TextDecoration.none,
      color: DarkTheme.white);

  static const heading4Light = TextStyle(
    fontFamily: 'montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.2,
    color: DarkTheme.white,
    decoration: TextDecoration.none,
  );

  static const subText = TextStyle(
    fontFamily: 'montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.2,
    color: DarkTheme.white70,
    decoration: TextDecoration.none,
  );

  static const headerText = TextStyle(
    fontFamily: 'montserrat',
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 1.2,
    color: DarkTheme.white,
    decoration: TextDecoration.none,
  );

  static const headerTextGrey = TextStyle(
    fontFamily: 'montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 20,
    height: 1.2,
    color: DarkTheme.white70,
    decoration: TextDecoration.none,
  );
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    Key? key,
    @required this.gradient,
  }) : super(key: key);

  final String text;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient!.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
