import 'package:flutter/material.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final double paddingTop;
  final double paddingLeft;

  const CustomTitle({
    Key? key,
    required this.title,
    required this.paddingTop,
    this.paddingLeft = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, left: paddingLeft),
      child: Text(
        title,
        style: TxtStyle.heading2,
      ),
    );
  }
}
