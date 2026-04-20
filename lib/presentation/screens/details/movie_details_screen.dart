import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/providers/watchlist_provider.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_dimensions.dart';
import 'package:movie_app/core/theme/app_text_styles.dart';
import 'package:movie_app/presentation/widgets/cached_poster_image.dart';
import 'package:movie_app/presentation/widgets/rating_badge.dart';
import 'package:movie_app/presentation/widgets/genre_chip.dart';
import 'package:movie_app/presentation/screens/image_viewer/full_screen_image.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Hero Banner
          SliverAppBar(
            expandedHeight: 500,
            pinned: true,
            stretch: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: AppColors.surface.withValues(alpha: 0.5),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CachedPosterImage(
                    imageUrl: movie.posterUrl,
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.surface,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Movie Info
          SliverPadding(
            padding: const EdgeInsets.all(AppDimensions.m),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(movie.title, style: AppTextStyles.headlineLarge),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              RatingBadge(
                                  rating: movie.imdbRating, showLabel: true),
                              const SizedBox(width: 12),
                              Text(
                                '${movie.year} • ${movie.runtime}',
                                style: AppTextStyles.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Consumer<WatchlistProvider>(
                      builder: (context, provider, child) {
                        final inWatchlist = provider.isInWatchlist(movie);
                        return IconButton.filledTonal(
                          onPressed: () => provider.toggleWatchlist(movie),
                          icon: Icon(
                            inWatchlist
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: inWatchlist
                                ? AppColors.primary
                                : AppColors.onSurfaceVariant,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.surfaceContainerHigh,
                          ),
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: AppDimensions.l),

                // Genres
                SizedBox(
                  height: 32,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movie.genres.length,
                    itemBuilder: (context, index) {
                      return GenreChip(label: movie.genres[index]);
                    },
                  ),
                ),

                const SizedBox(height: AppDimensions.l),

                // Plot
                Text('Synopsis', style: AppTextStyles.titleLarge),
                const SizedBox(height: 8),
                Text(
                  movie.plot,
                  style: AppTextStyles.bodyLarge.copyWith(height: 1.5),
                ),

                const SizedBox(height: AppDimensions.xl),

                // Cast
                Text('Cast', style: AppTextStyles.titleLarge),
                const SizedBox(height: 8),
                Text(
                  movie.actors.join(', '),
                  style: AppTextStyles.bodyMedium,
                ),

                const SizedBox(height: AppDimensions.xl),

                // Gallery
                if (movie.imageUrls.isNotEmpty) ...[
                  Text('Gallery', style: AppTextStyles.titleLarge),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movie.imageUrls.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenImage(
                                imageUrls: movie.imageUrls,
                                initialIndex: index,
                              ),
                            ),
                          ),
                          child: Container(
                            width: 240,
                            margin: const EdgeInsets.only(right: 12),
                            child: CachedPosterImage(
                              imageUrl: movie.imageUrls[index],
                              borderRadius:
                                  BorderRadius.circular(AppDimensions.radiusM),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],

                const SizedBox(height: 100),
              ]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.surface,
        icon: const Icon(Icons.play_arrow_rounded),
        label: const Text('Watch Now',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
