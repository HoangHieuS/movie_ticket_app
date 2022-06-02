import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app_ui/models/models.dart';
import 'package:movie_ticket_app_ui/screens/screens.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';
import 'package:movie_ticket_app_ui/widgets/widgets.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(title: 'Now Playing'),
        const SizedBox(height: 24),
        CarouselSlider(
          items: movies
              .map(
                (e) => Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MovieDetail(),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: size.width,
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              image: DecorationImage(
                                image: AssetImage(e.backgroundImg),
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  GradientPalette.black1,
                                  GradientPalette.black2,
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: size.width,
                                  margin:
                                      const EdgeInsets.only(bottom: 8, left: 8),
                                  child: Text(
                                    e.title,
                                    style: TxtStyle.heading2,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 8, bottom: 15),
                                  child: Row(
                                    children: const [
                                      _StarIcon(icon: Icons.star),
                                      _StarIcon(icon: Icons.star),
                                      _StarIcon(icon: Icons.star),
                                      _StarIcon(icon: Icons.star),
                                      _StarIcon(icon: Icons.star_half),
                                      Text(
                                        '(4.7)',
                                        style: TxtStyle.heading4,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
          ),
        ),
      ],
    );
  }
}

class _StarIcon extends StatelessWidget {
  final IconData icon;
  const _StarIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Icon(
        icon,
        color: DarkTheme.yellow,
        size: 14,
      ),
    );
  }
}
