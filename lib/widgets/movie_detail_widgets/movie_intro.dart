import 'package:flutter/material.dart';
import 'package:movie_ticket_app_ui/constants/constants.dart';
import 'package:movie_ticket_app_ui/models/models.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';
import 'package:movie_ticket_app_ui/widgets/widgets.dart';

class MovieIntro extends StatelessWidget {
  final String moviePoster;
  final String movieName;
  final TabController controller;
  final String movieDescription;
  final int movieIndex;
  const MovieIntro({
    Key? key,
    required this.moviePoster,
    required this.movieName,
    required this.controller,
    required this.movieDescription,
    this.movieIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 22, top: size.height / 4.5),
          child: Row(
            children: [
              SizedBox(
                width: size.width / 2.75,
                child: Image.asset(
                  moviePoster,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: MovieInfo(
                    title: movieName,
                    style: TxtStyle.headerText,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                alignment: Alignment.center,
                width: size.width,
                child: TabBar(
                  tabs: const [
                    Tab(text: 'About Movie'),
                    Tab(text: 'Review'),
                  ],
                  controller: controller,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: DarkTheme.white,
                  labelStyle: TxtStyle.headerText,
                  unselectedLabelStyle: TxtStyle.headerTextGrey,
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: [
                    _AboutMovie(
                      movieDescription: movieDescription,
                      movieIndex: movieIndex,
                      size: size,
                    ),
                    const Center(
                      child: Text('Review View'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AboutMovie extends StatelessWidget {
  const _AboutMovie({
    Key? key,
    required this.movieDescription,
    required this.movieIndex,
    required this.size,
  }) : super(key: key);

  final String movieDescription;
  final int movieIndex;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomTitle(
          title: 'Synosis',
          paddingTop: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 16, right: 24),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: movieDescription,
                  style: TxtStyle.heading4,
                ),
                const TextSpan(
                  text: ' Read more',
                  style: TextStyle(
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 1.2,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
        const CustomTitle(
          title: 'Cast & Crew',
          paddingTop: 28,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: movies[movieIndex]
                .casters
                .map(
                  (e) => Builder(
                    builder: (context) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16,
                              bottom: 16,
                              left: 24,
                            ),
                            child: Container(
                              width: size.width / 4.5,
                              height: size.width / 4.5,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(e.profileImageUrl),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              e.name,
                              style: TxtStyle.heading4Light,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
                .toList(),
          ),
        ),
        const CustomTitle(
          title: 'Trailer and song',
          paddingTop: 32,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 24),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: movies[movieIndex]
                  .trailers
                  .map(
                    (e) => Builder(
                      builder: (context) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 9),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 160,
                                    width: 260,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(e),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 160,
                                    width: 260,
                                    decoration: const BoxDecoration(
                                        color: Colors.black12),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: SizedBox(
                                      height: 160,
                                      width: 260,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 56),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: DarkTheme.blueMain,
                                        ),
                                        child: const ImageIcon(
                                          AssetImage(AssetPath.iconPlay),
                                          color: DarkTheme.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
