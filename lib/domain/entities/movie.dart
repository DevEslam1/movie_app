class Movie {
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final List<String> genres;
  final String director;
  final String writer;
  final List<String> actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String posterUrl;
  final String metascore;
  final String imdbRating;
  final String imdbVotes;
  final String imdbId;
  final String type;
  final List<String> imageUrls;
  final bool comingSoon;

  Movie({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genres,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.posterUrl,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbId,
    required this.type,
    required this.imageUrls,
    this.comingSoon = false,
  });

  double get ratingValue => double.tryParse(imdbRating) ?? 0.0;
  
  bool get isMovie => type == 'movie';
  bool get isSeries => type == 'series';
}
