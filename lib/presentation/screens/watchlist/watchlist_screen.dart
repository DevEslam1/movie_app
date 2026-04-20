import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/presentation/providers/watchlist_provider.dart';
import 'package:movie_app/core/theme/app_dimensions.dart';
import 'package:movie_app/presentation/widgets/poster_card.dart';
import 'package:movie_app/presentation/widgets/empty_state_widget.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watchlist'),
      ),
      body: Consumer<WatchlistProvider>(
        builder: (context, provider, child) {
          if (provider.watchlist.isEmpty) {
            return const EmptyStateWidget(
              icon: Icons.bookmark_outline,
              title: 'Your Watchlist is Empty',
              message: 'Save movies you want to watch later and they\'ll show up here.',
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(AppDimensions.m),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.55,
              crossAxisSpacing: AppDimensions.m,
              mainAxisSpacing: AppDimensions.m,
            ),
            itemCount: provider.watchlist.length,
            itemBuilder: (context, index) {
              return PosterCard(movie: provider.watchlist[index]);
            },
          );
        },
      ),
    );
  }
}
