import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app_ui/models/models.dart';
import 'package:movie_ticket_app_ui/screens/screens.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';
import 'package:movie_ticket_app_ui/widgets/widgets.dart';

class MovieSlideShow extends StatelessWidget {
  const MovieSlideShow({Key? key}) : super(key: key);

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
                            child: MovieInfo(
                              title: e.title,
                              style: TxtStyle.heading2,
                              isSlideShow: true,
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
