import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/data/modals/movie_model.dart';
import 'package:movieapp/presentation/components/widgets/custom_image_network_widget.dart';

/// Featured hero section with large banner
class HomeHeroSectionWidget extends StatelessWidget {
  const HomeHeroSectionWidget({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final aspectRatio = constraints.maxWidth > 600 ? 2.5 / 1 : 2.0 / 1;

        return AspectRatio(
          aspectRatio: aspectRatio,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 20,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomImageNetworkWidget(
                      photoUrl: movie.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.4),
                            Colors.black,
                          ],
                          stops: const [0.0, 0.6, 1.0],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.textColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'FEATURED',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                              height: 1.0,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 16,
                                      color: AppColors.starYellow,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      movie.rating.toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '• ${movie.genre} • ${movie.minutes != null ? '${movie.minutes}m' : ''}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textColor.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: AppColors.textColor,
                                    size: 20,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Watch Trailer',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
