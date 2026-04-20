import '../../domain/entities/movie.dart';

class MovieDto {
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final String metascore;
  final String imdbRating;
  final String imdbVotes;
  final String imdbId;
  final String type;
  final List<String>? images;
  final bool? comingSoon;

  MovieDto({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbId,
    required this.type,
    this.images,
    this.comingSoon,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return MovieDto(
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      rated: json['Rated'] ?? '',
      released: json['Released'] ?? '',
      runtime: json['Runtime'] ?? '',
      genre: json['Genre'] ?? '',
      director: json['Director'] ?? '',
      writer: json['Writer'] ?? '',
      actors: json['Actors'] ?? '',
      plot: json['Plot'] ?? '',
      language: json['Language'] ?? '',
      country: json['Country'] ?? '',
      awards: json['Awards'] ?? '',
      poster: json['Poster'] ?? '',
      metascore: json['Metascore'] ?? '',
      imdbRating: json['imdbRating'] ?? '',
      imdbVotes: json['imdbVotes'] ?? '',
      imdbId: json['imdbID'] ?? '',
      type: json['Type'] ?? '',
      images: json['Images'] != null ? List<String>.from(json['Images']) : null,
      comingSoon: json['ComingSoon'],
    );
  }

  Movie toDomain() {
    return Movie(
      title: title,
      year: year,
      rated: rated,
      released: released,
      runtime: runtime,
      genres: genre.split(', ').toList(),
      director: director,
      writer: writer,
      actors: actors.split(', ').toList(),
      plot: plot,
      language: language,
      country: country,
      awards: awards,
      posterUrl: poster,
      metascore: metascore,
      imdbRating: imdbRating,
      imdbVotes: imdbVotes,
      imdbId: imdbId,
      type: type,
      imageUrls: images ?? [],
      comingSoon: comingSoon ?? false,
    );
  }
}
