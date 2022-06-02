import 'package:flutter/material.dart';
import 'package:movie_ticket_app_ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeHeader(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 30,
            ),
            sliver: SliverToBoxAdapter(
              child: SearchBar(),
            ),
          ),
          SliverToBoxAdapter(
            child: CategoryBar(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 30,
            ),
            sliver: SliverToBoxAdapter(
              child: MovieSlider(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            sliver: SliverToBoxAdapter(
              child: ComingSoonMovie(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            sliver: SliverToBoxAdapter(
              child: Promo(),
            ),
          ),
        ],
      ),
    );
  }
}
