import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/data/modals/movie_spec_modal.dart';
import 'package:movieapp/presentation/pages/homePage/components/widgets/movie_card_widget.dart';
import 'package:movieapp/utils/screen_utils.dart';

class MovieGridViewList extends StatelessWidget {
  const MovieGridViewList({
    required this.items,
    super.key,
  });

  final List<MovieSpecModal> items;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = ScreenUtils.getHorizontalPadding(context);

    return Container(
      color: AppColors.surface(context),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.67,
          ),
          itemBuilder: (context, index) {
            return MovieCardWidget(movie: items[index]);
          },
        ),
      ),
    );
  }
}
