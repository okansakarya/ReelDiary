import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/data/modals/movie_model.dart';
import 'package:movieapp/presentation/pages/homePage/components/widgets/home_movie_item_widget.dart';

/// Trending section with header and movie grid
class HomeTrendingSectionWidget extends StatelessWidget {
  const HomeTrendingSectionWidget({
    super.key,
    required this.movies,
  });

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Trending Now',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'See All',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.6,
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return HomeMovieItemWidget(
              movie: movies[index],
              onTap: () {},
            );
          },
        ),
      ],
    );
  }
}
