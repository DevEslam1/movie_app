import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_dimensions.dart';
import 'package:movie_app/core/theme/app_text_styles.dart';
import 'package:movie_app/presentation/widgets/cached_poster_image.dart';
import 'package:movie_app/presentation/screens/details/movie_details_screen.dart';

class PosterCard extends StatelessWidget {
  final Movie movie;

  const PosterCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailsScreen(movie: movie),
        ),
      ),
      child: SizedBox(
        width: AppDimensions.posterWidth,
        child: Padding(
          padding: const EdgeInsets.only(right: AppDimensions.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    CachedPosterImage(
                      imageUrl: movie.posterUrl,
                      borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    // Trailer Badge
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.white30, width: 0.5),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.play_circle_outline,
                                color: AppColors.primary, size: 10),
                            const SizedBox(width: 4),
                            Text(
                              'TRAILER',
                              style: AppTextStyles.labelSmall.copyWith(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.s),
              Text(
                movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.titleSmall.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 10),
                  const SizedBox(width: 4),
                  Text(
                    movie.imdbRating,
                    style: AppTextStyles.bodySmall.copyWith(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
