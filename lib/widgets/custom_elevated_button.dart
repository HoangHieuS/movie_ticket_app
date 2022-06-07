import 'package:flutter/material.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final double width;
  final double height;
  final double size;

  const CustomElevatedButton({
    Key? key,
    this.onTap,
    required this.text,
    required this.width,
    required this.height, required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Ink(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                GradientPalette.blue1,
                GradientPalette.blue2,
              ],
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(fontSize: size, color: DarkTheme.white,),
          ),
        ),
      ),
    );
  }
}
