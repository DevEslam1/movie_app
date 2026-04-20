import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/core/theme/app_dimensions.dart';
import 'package:movie_app/core/theme/app_text_styles.dart';
import 'package:movie_app/presentation/widgets/cached_poster_image.dart';
import 'package:movie_app/presentation/widgets/rating_badge.dart';
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
      child: Container(
        width: AppDimensions.posterWidth,
        margin: const EdgeInsets.only(right: AppDimensions.m),
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
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: RatingBadge(rating: movie.imdbRating),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.s),
            Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.titleSmall,
            ),
            const SizedBox(height: 2),
            Text(
              '${movie.year} • ${movie.runtime}',
              style: AppTextStyles.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
