import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/core/constants/tmdb_constants.dart';
import 'package:movieapp/data/modals/movie_spec_modal.dart';
import 'package:movieapp/presentation/components/widgets/custom_image_network_widget.dart';

class MovieCardWidget extends StatelessWidget {
  final MovieSpecModal movie;

  const MovieCardWidget({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    final hasPoster = movie.posterPath != null &&
        movie.posterPath!.trim().isNotEmpty;
    final fullPosterUrl = hasPoster
        ? TmdbConstants.posterBaseUrl + movie.posterPath!
        : null;
    final surfaceVar = AppColors.surfaceVariant(context);
    final textPrim = AppColors.textPrimary(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 140,
        height: 210,
        decoration: BoxDecoration(color: surfaceVar),
        child: Stack(
          children: [
            /// Poster Image
            Positioned.fill(
              child: fullPosterUrl != null
                  ? CustomImageNetworkWidget(photoUrl: fullPosterUrl)
                  : Container(
                      color: surfaceVar,
                      child: Icon(
                        Icons.movie,
                        color: textPrim.withValues(alpha: 0.54),
                        size: 40,
                      ),
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
                      AppColors.surface(context).withValues(alpha: 0.8),
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
                style: TextStyle(
                  color: textPrim,
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
