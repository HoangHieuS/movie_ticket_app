import 'package:flutter/material.dart';
import 'package:movie_ticket_app_ui/constants/constants.dart';

class CustomContainer extends StatelessWidget {
  final double size;
  final Color color1;
  final Color color2;
  final bool hasImg;

  const CustomContainer({
    Key? key,
    required this.size,
    required this.color1,
    required this.color2,
    this.hasImg = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      decoration: BoxDecoration(
        image: hasImg == true ? const DecorationImage(
          image: AssetImage(AssetPath.teaserRalph),
          fit: BoxFit.cover,
        ) : null,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color1,
            color2,
          ],
        ),
      ),
    );
  }
}
