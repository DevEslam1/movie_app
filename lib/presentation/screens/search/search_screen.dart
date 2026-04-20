import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/presentation/providers/movie_provider.dart';
import 'package:movie_app/presentation/providers/search_provider.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_dimensions.dart';
import 'package:movie_app/core/theme/app_text_styles.dart';
import 'package:movie_app/presentation/widgets/poster_card.dart';
import 'package:movie_app/presentation/widgets/empty_state_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    
    return ChangeNotifierProvider(
      create: (_) => SearchProvider(allMovies: movieProvider.allMovies),
      child: Consumer<SearchProvider>(
        builder: (context, searchProvider, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Search'),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.m),
                  child: TextField(
                    controller: _searchController,
                    onChanged: searchProvider.search,
                    style: AppTextStyles.bodyLarge,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.surfaceContainerHigh,
                      hintText: 'Search movies, actors, directors...',
                      hintStyle: AppTextStyles.bodyMedium,
                      prefixIcon: const Icon(Icons.search, color: AppColors.primary),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.close, color: AppColors.onSurfaceVariant),
                              onPressed: () {
                                _searchController.clear();
                                searchProvider.clearSearch();
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: _buildBody(searchProvider),
          );
        },
      ),
    );
  }

  Widget _buildBody(SearchProvider provider) {
    if (provider.query.isEmpty) {
      return const EmptyStateWidget(
        icon: Icons.search,
        title: 'Search CineStream',
        message: 'Find your favorite movies, series, and actors in one place.',
      );
    }

    if (provider.searchResults.isEmpty) {
      return const EmptyStateWidget(
        icon: Icons.sentiment_dissatisfied_outlined,
        title: 'No results found',
        message: 'We couldn\'t find what you were looking for. Try a different keyword.',
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(AppDimensions.m),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.55,
        crossAxisSpacing: AppDimensions.m,
        mainAxisSpacing: AppDimensions.m,
      ),
      itemCount: provider.searchResults.length,
      itemBuilder: (context, index) {
        return PosterCard(movie: provider.searchResults[index]);
      },
    );
  }
}
