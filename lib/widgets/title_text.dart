import 'package:flutter/material.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader textGradient = LinearGradient(
      colors: [
        GradientPalette.lightBlue1,
        GradientPalette.lightBlue2,
      ],
    ).createShader(const Rect.fromLTWH(0, 0, 200, 70));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TxtStyle.heading2,
        ),
        Text(
          'View all',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            foreground: Paint()..shader = textGradient,
          ),
        ),
      ],
    );
  }
}
