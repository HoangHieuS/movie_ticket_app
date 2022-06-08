import 'package:flutter/material.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';

class MovieInfo extends StatelessWidget {
  final String title;
  final TextStyle style;
  final bool isSlideShow;

  const MovieInfo({
    Key? key,
    required this.title,
    this.isSlideShow = false,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment:
          isSlideShow ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
              left: isSlideShow == true ? 8 : 14,
              bottom: isSlideShow == true ? 8 : 12),
          width: size.width,
          child: Text(
            title,
            style: style,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: isSlideShow == true ? 8 : 14,
              bottom: isSlideShow == true ? 15 : 12),
          child: Row(
            children: const [
              _StarIcon(icon: Icons.star),
              _StarIcon(icon: Icons.star),
              _StarIcon(icon: Icons.star),
              _StarIcon(icon: Icons.star),
              _StarIcon(icon: Icons.star_half),
              Text(
                '(4.7)',
                style: TextStyle(
                  fontSize: 10,
                  color: DarkTheme.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        isSlideShow == true
            ? const SizedBox.shrink()
            : Container(
                padding: const EdgeInsets.only(left: 14, bottom: 6),
                width: size.width,
                child: const Text(
                  'Action & adventure, Comedy',
                  style: TxtStyle.subText,
                ),
              ),
        isSlideShow == true
            ? const SizedBox.shrink()
            : Container(
                padding: const EdgeInsets.only(left: 14),
                width: size.width,
                child: const Text(
                  '1h 41min',
                  style: TxtStyle.subText,
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
        size: 18,
      ),
    );
  }
}
