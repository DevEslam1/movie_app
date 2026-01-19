class Movie {
  final String title;
  final int year;
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
  final double metascore;
  final double imdbRating;
  final String imdbVotes;
  final String imdbID;
  final String type;
  final String response;
  final List<String> images;

  Movie({
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
    required this.imdbID,
    required this.type,
    required this.response,
    required this.images,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    final String posterUrl = json['Poster'] ?? '';
    final List<String> imagesList = List<String>.from(json['Images'] ?? []);
    final String finalPoster = posterUrl.isNotEmpty && posterUrl != 'N/A'
        ? posterUrl
        : (imagesList.isNotEmpty ? imagesList[0] : '');

    return Movie(
      title: json['Title'] ?? '',
      year: int.tryParse(json['Year'] ?? '0') ?? 0,
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
      poster: finalPoster,
      metascore: double.tryParse(json['Metascore'] ?? '0.0') ?? 0.0,
      imdbRating: double.tryParse(json['imdbRating'] ?? '0.0') ?? 0.0,
      imdbVotes: json['imdbVotes'] ?? '',
      imdbID: json['imdbID'] ?? '',
      type: json['Type'] ?? '',
      response: json['Response'] ?? '',
      images: imagesList,
    );
  }
}
