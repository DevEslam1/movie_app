import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/presentation/providers/movie_provider.dart';
import 'package:movie_app/core/constants/app_constants.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_dimensions.dart';
import 'package:movie_app/core/theme/app_text_styles.dart';
import 'package:movie_app/presentation/widgets/hero_movie_card.dart';
import 'package:movie_app/presentation/widgets/movie_carousel.dart';
import 'package:movie_app/presentation/widgets/genre_chip.dart';
import 'package:movie_app/presentation/widgets/shimmer_loading.dart';
import 'package:movie_app/presentation/screens/movie_grid/movie_grid_screen.dart';

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
                backgroundColor: AppColors.surface.withValues(alpha: 0.9),
                surfaceTintColor: Colors.transparent,
                leading: const Icon(Icons.menu, color: Colors.white),
                title: Text(
                  AppConstants.appName,
                  style: AppTextStyles.titleLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                centerTitle: true,
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.person, size: 20, color: Colors.black),
                    ),
                  ),
                ],
              ),

              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimensions.m),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const SizedBox(height: AppDimensions.m),
                    
                    // Now Playing Section
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppDimensions.m),
                      child: Text(
                        'Now Playing',
                        style: AppTextStyles.titleLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    if (featuredMovie != null) ...[
                      HeroMovieCard(movie: featuredMovie),
                    ],

                    const SizedBox(height: AppDimensions.xl),

                    // Genre Section
                    SizedBox(
                      height: 40,
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

                    const SizedBox(height: AppDimensions.xl),

                    // Trending Section
                    if (trendingMovies.isNotEmpty)
                      MovieCarousel(
                        title: 'Trending',
                        movies: trendingMovies,
                        onSeeAll: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieGridScreen(
                                title: 'Trending',
                                movies: trendingMovies,
                              ),
                            ),
                          );
                        },
                      ),

                    const SizedBox(height: AppDimensions.m),

                    // Genre Specific Section
                    if (genreMovies.isNotEmpty)
                      MovieCarousel(
                        title: 'Popular in $_selectedGenre',
                        movies: genreMovies,
                        onSeeAll: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieGridScreen(
                                title: 'Popular in $_selectedGenre',
                                movies: genreMovies,
                              ),
                            ),
                          );
                        },
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
