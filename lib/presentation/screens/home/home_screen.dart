import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/presentation/providers/movie_provider.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_dimensions.dart';
import 'package:movie_app/core/theme/app_text_styles.dart';
import 'package:movie_app/presentation/widgets/hero_movie_card.dart';
import 'package:movie_app/presentation/widgets/movie_carousel.dart';
import 'package:movie_app/presentation/widgets/genre_chip.dart';
import 'package:movie_app/presentation/widgets/shimmer_loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedGenre = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          if (provider.state == MovieState.loading) {
            return const HomeLoadingState();
          }

          if (provider.state == MovieState.error) {
            return const Center(child: Text('Failed to load movies'));
          }

          final featuredMovie = provider.featuredMovie;
          final trendingMovies = provider.trendingMovies;
          final genreMovies = provider.getMoviesByGenre(_selectedGenre);

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Top App Bar
              SliverAppBar(
                floating: true,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                title: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.movie_filter_rounded, color: AppColors.surface, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Text('CineStream', style: AppTextStyles.titleLarge),
                  ],
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none_rounded),
                  ),
                  const SizedBox(width: 8),
                ],
              ),

              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimensions.m),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(height: AppDimensions.m),
                    
                    // Featured Section
                    if (featuredMovie != null) ...[
                      HeroMovieCard(movie: featuredMovie),
                    ],

                    const SizedBox(height: AppDimensions.xl),

                    // Genre Section
                    SizedBox(
                      height: 48,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.allGenres.length,
                        itemBuilder: (context, index) {
                          final genre = provider.allGenres[index];
                          return GenreChip(
                            label: genre,
                            isSelected: _selectedGenre == genre,
                            onTap: () => setState(() => _selectedGenre = genre),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: AppDimensions.m),

                    // Trending Section
                    if (trendingMovies.isNotEmpty)
                      MovieCarousel(
                        title: 'Trending Now',
                        movies: trendingMovies,
                        onSeeAll: () {},
                      ),

                    const SizedBox(height: AppDimensions.m),

                    // Genre Specific Section
                    if (genreMovies.isNotEmpty)
                      MovieCarousel(
                        title: 'Popular in $_selectedGenre',
                        movies: genreMovies,
                        onSeeAll: () {},
                      ),
                    
                    // Bottom spacing for glass nav
                    const SizedBox(height: 120),
                  ]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class HomeLoadingState extends StatelessWidget {
  const HomeLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.m),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const ShimmerLoading(width: double.infinity, height: 400),
            const SizedBox(height: 32),
            const ShimmerLoading(width: 150, height: 24),
            const SizedBox(height: 16),
            Row(
              children: List.generate(
                3,
                (index) => const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: ShimmerLoading(width: 140, height: 210),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
