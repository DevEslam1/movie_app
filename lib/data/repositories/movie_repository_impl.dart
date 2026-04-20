import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/local_movie_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final LocalMovieDatasource datasource;

  MovieRepositoryImpl({required this.datasource});

  @override
  Future<List<Movie>> getAllMovies() async {
    final dtos = await datasource.getMovies();
    return dtos.map((dto) => dto.toDomain()).toList();
  }
}
