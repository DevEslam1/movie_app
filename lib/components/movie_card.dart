import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/movie_details.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _elevationAnimation = Tween<double>(begin: 4.0, end: 16.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    _animationController.forward().then((_) {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: MovieDetails(movie: widget.movie),
            );
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ).then((_) {
        _animationController.reverse();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      onTapDown: (_) => _animationController.forward(),
      onTapUp: (_) => _animationController.reverse(),
      onTapCancel: () => _animationController.reverse(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedBuilder(
            animation: _elevationAnimation,
            builder: (context, child) {
              return Card(
                elevation: _elevationAnimation.value,
                child: child,
              );
            },
            child: _buildCardContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildCardContent() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMoviePoster(),
          SizedBox(width: 16),
          Expanded(
            child: _buildMovieInfo(),
          ),
        ],
      ),
    );
  }

  Widget _buildMoviePoster() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: widget.movie.images.isEmpty
          ? Container(
              width: 70,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.movie,
                size: 40,
                color: Colors.grey[600],
              ),
            )
          : FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: widget.movie.images[0],
              fit: BoxFit.cover,
              height: 100,
              width: 70,
              imageErrorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 70,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.error,
                    color: Colors.red[300],
                  ),
                );
              },
            ),
    );
  }

  Widget _buildMovieInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.movie.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8),
        Text(
          'Director: ${widget.movie.director}',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[400],
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4),
        Text(
          'Year: ${widget.movie.year}',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[500],
          ),
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Icon(
              Icons.star,
              size: 16,
              color: Colors.amber,
            ),
            SizedBox(width: 4),
            Text(
              '${widget.movie.imdbRating}/10',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
