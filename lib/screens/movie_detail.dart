import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_ticket_app_ui/constants/constants.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';
import 'package:movie_ticket_app_ui/widgets/widgets.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: _currentIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height * 2,
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      CustomContainer(
                        size: size.height / 3.5,
                        color1: GradientPalette.black1,
                        color2: GradientPalette.black2,
                        hasImg: true,
                      ),
                      CustomContainer(
                        size: 200,
                        color1: GradientPalette.black2,
                        color2: GradientPalette.black1,
                      ),
                    ],
                  ),
                  CustomContainer(
                    size: size.height / 3.5,
                    color1: GradientPalette.black1,
                    color2: GradientPalette.black2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: DarkTheme.white,
                      ),
                    ),
                  ),
                  MovieIntro(
                    controller: _tabController,
                    movieDescription: AppConstant.exampleContent,
                    movieName: 'Ralph Breaks the Internet',
                    moviePoster: AssetPath.posterRalph,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
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
                    width: 320,
                    height: 60,
                    alignment: Alignment.center,
                    child: const Text(
                      'Back Now',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
