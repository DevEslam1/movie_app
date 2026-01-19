import 'package:flutter/material.dart';
import 'package:movie_app/components/movie_card.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MovieProvider()..loadMovies(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: ThemeMode.system,
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.amber,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      cardTheme: CardThemeData(
        color: Colors.grey[100],
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey[700],
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.amber,
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF1a1a1a),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      scaffoldBackgroundColor: Color(0xFF121212),
      cardTheme: CardThemeData(
        color: Color(0xFF1f1f1f),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textTheme: TextTheme(
        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey[300],
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _scrollController;
  bool _showAppBar = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    bool newShowAppBar = _scrollController.position.pixels < 50;
    if (newShowAppBar != _showAppBar) {
      setState(() {
        _showAppBar = newShowAppBar;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showAppBar
          ? AppBar(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 50,
                  ),
                  SizedBox(width: 12),
                  Text('Movie App'),
                ],
              ),
            )
          : null,
      body: Consumer<MovieProvider>(
        builder: (context, movieData, _) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: movieData.isLoading
                ? Center(
                    key: ValueKey('loading'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                            Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text('Loading movies...'),
                      ],
                    ),
                  )
                : movieData.errorMessage != null
                    ? Center(
                        key: ValueKey('error'),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 48,
                              color: Colors.red[400],
                            ),
                            SizedBox(height: 16),
                            Text(
                              movieData.errorMessage!,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        key: ValueKey('list'),
                        controller: _scrollController,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        itemCount: movieData.movieList.length,
                        itemBuilder: (context, index) {
                          final movie = movieData.movieList[index];
                          return MovieCard(movie: movie);
                        },
                      ),
          );
        },
      ),
    );
  }
}
