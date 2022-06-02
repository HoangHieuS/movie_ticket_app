import 'package:flutter/material.dart';
import 'package:movie_ticket_app_ui/utils/utils.dart';
import 'package:movie_ticket_app_ui/widgets/widgets.dart';

class Promo extends StatelessWidget {
  const Promo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TitleText(title: 'Promo'),
        SizedBox(height: 24),
        _PromoCode(
          title: 'Student Holiday',
          description: 'Maximal only for two people',
          discount: 50,
        ),
        SizedBox(height: 16),
        _PromoCode(
          title: 'Student Holiday',
          description: 'Maximal only for two people',
          discount: 50,
        ),
        SizedBox(height: 16),
        _PromoCode(
          title: 'Student Holiday',
          description: 'Maximal only for two people',
          discount: 50,
        ),
      ],
    );
  }
}

class _PromoCode extends StatelessWidget {
  final String title;
  final String description;
  final int discount;
  const _PromoCode({
    Key? key,
    required this.title,
    required this.description,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [
            GradientPalette.blue1,
            GradientPalette.blue2,
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TxtStyle.heading3,
                  ),
                  Text(
                    description,
                    style: TxtStyle.heading4,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'OFF ',
                      style: TxtStyle.heading3Medium,
                    ),
                    TextSpan(
                      text: '$discount%',
                      style: TxtStyle.heading3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
