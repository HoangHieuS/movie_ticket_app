import 'package:flutter/material.dart';
import 'package:movie_ticket_app_ui/constants/constants.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 76, left: 24, right: 24),
      child: SizedBox(
        height: size.height / 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Find Your Best\nMovie',
              style: TxtStyle.heading1SemiBold,
            ),
            CircleAvatar(
              radius: size.height / 24,
              backgroundImage: const AssetImage(AssetPath.iconProfile),
            ),
          ],
        ),
      ),
    );
  }
}
