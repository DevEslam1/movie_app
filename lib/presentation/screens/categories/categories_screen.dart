import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/presentation/providers/movie_provider.dart';
import 'package:movie_app/core/theme/app_dimensions.dart';
import 'package:movie_app/presentation/widgets/poster_card.dart';
import 'package:movie_app/presentation/widgets/genre_chip.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Consumer<MovieProvider>(
            builder: (context, provider, child) {
              return SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: AppDimensions.m),
                  itemCount: provider.allGenres.length,
                  itemBuilder: (context, index) {
                    final genre = provider.allGenres[index];
                    return GenreChip(
                      label: genre,
                      isSelected: _selectedCategory == genre,
                      onTap: () => setState(() => _selectedCategory = genre),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          final movies = provider.getMoviesByGenre(_selectedCategory);

          return GridView.builder(
            padding: const EdgeInsets.all(AppDimensions.m),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.55,
              crossAxisSpacing: AppDimensions.m,
              mainAxisSpacing: AppDimensions.m,
            ),
            itemCount: movies.length,
            cacheExtent: 2000,
            itemBuilder: (context, index) {
              return PosterCard(movie: movies[index]);
            },
          );
        },
      ),
    );
  }
}
