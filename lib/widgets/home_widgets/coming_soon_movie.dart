import 'package:flutter/material.dart';
import 'package:movie_ticket_app_ui/models/models.dart';
import 'package:movie_ticket_app_ui/widgets/widgets.dart';

class ComingSoonMovie extends StatelessWidget {
  const ComingSoonMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(title: 'Coming Soon'),
        const SizedBox(height: 24),
        Row(
          children: movies
              .map(
                (e) => Builder(
                  builder: (context) {
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        child: Image.asset(e.posterImg),
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
