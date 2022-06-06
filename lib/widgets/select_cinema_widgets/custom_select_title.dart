import 'package:flutter/material.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';

class CustomSelectTitle extends StatelessWidget {
  final String title;

  const CustomSelectTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24),
      child: Text(
        title,
        style: TxtStyle.heading1Half,
      ),
    );
  }
}
