import 'package:flutter/material.dart';
import '../../domain/entities/movie.dart';
import '../../core/theme/app_dimensions.dart';
import 'poster_card.dart';
import 'section_header.dart';

class MovieCarousel extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final VoidCallback? onSeeAll;

  const MovieCarousel({
    super.key,
    required this.title,
    required this.movies,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title, onSeeAll: onSeeAll),
        SizedBox(
          height: AppDimensions.posterHeight + 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            cacheExtent: 1000,
            itemBuilder: (context, index) => PosterCard(movie: movies[index]),
          ),
        ),
      ],
    );
  }
}
