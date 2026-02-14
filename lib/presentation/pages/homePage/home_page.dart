import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/data/modals/movie_model.dart';
import 'package:movieapp/presentation/components/widgets/home_bottom_nav_widget.dart';
import 'package:movieapp/presentation/pages/homePage/components/widgets/home_header_widget.dart';
import 'package:movieapp/presentation/pages/homePage/components/widgets/home_hero_section_widget.dart';
import 'package:movieapp/presentation/pages/homePage/components/widgets/home_tabs_widget.dart';
import 'package:movieapp/presentation/pages/homePage/components/widgets/home_trending_section_widget.dart';
import 'package:movieapp/utils/screen_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = ScreenUtils.getHorizontalPadding(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 16,
              ),
              child: const HomeHeaderWidget(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: horizontalPadding,
                        right: horizontalPadding,
                        top: 8,
                        bottom: 24,
                      ),
                      child: const HomeHeroSectionWidget(
                        movie: MovieModel.featured,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      child: const HomeTabsWidget(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(horizontalPadding),
                      child: const HomeTrendingSectionWidget(
                        movies: MovieModel.trending,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 80,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
