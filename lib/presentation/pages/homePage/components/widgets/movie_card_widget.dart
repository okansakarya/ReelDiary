import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/core/constants/tmdb_constants.dart';
import 'package:movieapp/data/modals/movie_spec_modal.dart';
import 'package:movieapp/presentation/components/widgets/custom_image_network_widget.dart';

class MovieCardWidget extends StatelessWidget {
  final MovieSpecModal movie;

  const MovieCardWidget({required this.movie, super.key});

  static Widget _placeholderIcon() => Icon(
        Icons.movie,
        color: AppColors.textColor.withValues(alpha: 0.54),
        size: 40,
      );

  @override
  Widget build(BuildContext context) {
    final hasPoster = movie.posterPath != null &&
        movie.posterPath!.trim().isNotEmpty;
    final fullPosterUrl = hasPoster
        ? TmdbConstants.posterBaseUrl + movie.posterPath!
        : null;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 140,
        height: 210,
        decoration: BoxDecoration(color: AppColors.cardDark),
        child: Stack(
          children: [
            /// Poster Image
            Positioned.fill(
              child: fullPosterUrl != null
                  ? CustomImageNetworkWidget(photoUrl: fullPosterUrl)
                  : Container(
                      color: AppColors.surfaceDark,
                      child: _placeholderIcon(),
                    ),
            ),

            /// Gradient Overlay
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppColors.backgroundDark.withValues(alpha: 0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            /// Movie Title
            Positioned(
              left: 8,
              right: 8,
              bottom: 8,
              child: Text(
                movie.movie_name.isNotEmpty ? movie.movie_name : '—',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
