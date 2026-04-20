import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_dimensions.dart';
import 'package:movie_app/core/theme/app_text_styles.dart';
import 'package:movie_app/presentation/widgets/cached_poster_image.dart';

class MockVideoPlayerScreen extends StatefulWidget {
  final Movie movie;

  const MockVideoPlayerScreen({super.key, required this.movie});

  @override
  State<MockVideoPlayerScreen> createState() => _MockVideoPlayerScreenState();
}

class _MockVideoPlayerScreenState extends State<MockVideoPlayerScreen> {
  bool _isPlaying = true;
  double _progress = 0.3; // Mock initial progress
  bool _showControls = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          setState(() {
            _showControls = !_showControls;
          });
        },
        child: Stack(
          children: [
            // Mock Video Content (Image with slight zoom & blur)
            SizedBox.expand(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedPosterImage(
                    imageUrl: widget.movie.posterUrl,
                    fit: BoxFit.cover,
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.4),
                    ),
                  ),
                ],
              ),
            ),

            // Controls Overlay
            AnimatedOpacity(
              opacity: _showControls ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                color: Colors.black.withValues(alpha: 0.4),
                child: SafeArea(
                  child: Column(
                    children: [
                      _buildHeader(),
                      const Spacer(),
                      _buildCenterControls(),
                      const Spacer(),
                      _buildBottomControls(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.m),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: AppDimensions.s),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.movie.title,
                  style: AppTextStyles.titleMedium.copyWith(color: Colors.white),
                ),
                Text(
                  'Streaming in 4K',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.cast, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCenterControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.replay_10, size: 48, color: Colors.white),
          onPressed: () {},
        ),
        const SizedBox(width: AppDimensions.xl),
        GestureDetector(
          onTap: () => setState(() => _isPlaying = !_isPlaying),
          child: Container(
            padding: const EdgeInsets.all(AppDimensions.m),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
              size: 56,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: AppDimensions.xl),
        IconButton(
          icon: const Icon(Icons.forward_10, size: 48, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.m),
      child: Column(
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppColors.primary,
              inactiveTrackColor: Colors.white.withValues(alpha: 0.3),
              thumbColor: AppColors.primary,
              trackHeight: 4,
              overlayColor: AppColors.primary.withValues(alpha: 0.2),
            ),
            child: Slider(
              value: _progress,
              onChanged: (value) => setState(() => _progress = value),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.m),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '32:45',
                  style: AppTextStyles.bodySmall.copyWith(color: Colors.white),
                ),
                Text(
                  widget.movie.runtime,
                  style: AppTextStyles.bodySmall.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.l),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildControlItem(Icons.closed_caption_outlined, 'Captions'),
              _buildControlItem(Icons.speed, '1.0x'),
              _buildControlItem(Icons.video_library_outlined, 'Episodes'),
              _buildControlItem(Icons.more_horiz, 'More'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildControlItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
