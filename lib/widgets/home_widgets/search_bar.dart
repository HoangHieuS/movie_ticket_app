import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_ticket_app_ui/constants/constants.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 15,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: size.height / 15,
              decoration: BoxDecoration(
                color: DarkTheme.darkBackground,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24,
                      right: 12,
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: DarkTheme.white,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search movie',
                        hintStyle: TxtStyle.heading3Medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 12),
            width: size.height / 15,
            height: size.height / 15,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  GradientPalette.blue1,
                  GradientPalette.blue2,
                ],
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Image.asset(AssetPath.iconControl),
          ),
        ],
      ),
    );
  }
}
