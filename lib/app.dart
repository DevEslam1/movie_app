import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/splash/splash_screen.dart';
import 'presentation/providers/movie_provider.dart';
import 'presentation/providers/watchlist_provider.dart';
import 'data/datasources/local_movie_datasource.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'domain/usecases/get_all_movies.dart';

class CineStreamApp extends StatelessWidget {
  const CineStreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency Injection Setup
    final localDatasource = LocalMovieDatasource();
    final movieRepository = MovieRepositoryImpl(datasource: localDatasource);
    final getAllMoviesUseCase = GetAllMovies(repository: movieRepository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieProvider(
            getAllMoviesUseCase: getAllMoviesUseCase,
          )..loadMovies(),
        ),
        ChangeNotifierProvider(
          create: (_) => WatchlistProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'CineStream',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
