import 'package:flutter/material.dart';
import 'package:movie_ticket_app_ui/models/models.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({Key? key}) : super(key: key);

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 18,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Container(
                alignment: Alignment.center,
                width: size.width / 4,
                decoration: _selectedIndex == index
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            GradientPalette.lightBlue1,
                            GradientPalette.lightBlue2,
                          ],
                        ),
                      )
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: DarkTheme.darkBackground,
                      ),
                child: Text(
                  genres[index],
                  style: TxtStyle.heading3,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
