import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/core/theme/app_dimensions.dart';
import 'package:movie_app/presentation/widgets/poster_card.dart';

class MovieGridScreen extends StatelessWidget {
  final String title;
  final List<Movie> movies;

  const MovieGridScreen({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(AppDimensions.m),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.55,
          crossAxisSpacing: AppDimensions.m,
          mainAxisSpacing: AppDimensions.m,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return PosterCard(movie: movies[index]);
        },
      ),
    );
  }
}
