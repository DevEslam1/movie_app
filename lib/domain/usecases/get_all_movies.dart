import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetAllMovies {
  final MovieRepository repository;

  GetAllMovies({required this.repository});

  Future<List<Movie>> execute() async {
    return await repository.getAllMovies();
  }
}
