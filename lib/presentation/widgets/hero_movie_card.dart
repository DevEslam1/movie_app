import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_dimensions.dart';
import 'package:movie_app/core/theme/app_text_styles.dart';
import 'package:movie_app/presentation/widgets/cached_poster_image.dart';
import 'package:movie_app/presentation/widgets/rating_badge.dart';
import 'package:movie_app/presentation/screens/details/movie_details_screen.dart';

class HeroMovieCard extends StatelessWidget {
  final Movie movie;

  const HeroMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailsScreen(movie: movie),
        ),
      ),
      child: Container(
        height: AppDimensions.heroCardHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Background Image
            CachedPosterImage(
              imageUrl: movie.posterUrl,
              width: double.infinity,
              height: double.infinity,
            ),

            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    AppColors.surface.withValues(alpha: 0.2),
                    AppColors.surface.withValues(alpha: 0.9),
                    AppColors.surface,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 0.4, 0.8, 1.0],
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(AppDimensions.l),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBadge(rating: movie.imdbRating, showLabel: true),
                  const SizedBox(height: AppDimensions.s),
                  Text(
                    movie.title,
                    style: AppTextStyles.headlineLarge,
                  ),
                  const SizedBox(height: AppDimensions.xs),
                  Text(
                    '${movie.year} • ${movie.runtime} • ${movie.genres.take(2).join(', ')}',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.onSurface.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.m),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow_rounded, size: 24),
                    label: const Text('Watch Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.surface,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.xl,
                        vertical: AppDimensions.m,
                      ),
                      textStyle: AppTextStyles.labelLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.radiusM),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
