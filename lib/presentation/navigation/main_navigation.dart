import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/screens/home/home_screen.dart';
import 'package:movie_app/presentation/screens/categories/categories_screen.dart';
import 'package:movie_app/presentation/screens/search/search_screen.dart';
import 'package:movie_app/presentation/screens/watchlist/watchlist_screen.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_dimensions.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const SearchScreen(),
    const WatchlistScreen(),
    const Scaffold(body: Center(child: Text('Profile'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        height: AppDimensions.bottomNavHeight,
        margin: const EdgeInsets.all(AppDimensions.m),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surface.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(AppDimensions.radiusXL),
                border: Border.all(
                  color: AppColors.onSurface.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: (index) => setState(() => _selectedIndex = index),
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: AppColors.primary,
                unselectedItemColor: Colors.white.withValues(alpha: 0.5),
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(fontSize: 10),
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: 'HOME',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.explore_outlined),
                    activeIcon: Icon(Icons.explore),
                    label: 'DISCOVER',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search_outlined),
                    activeIcon: Icon(Icons.search),
                    label: 'SEARCH',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_border),
                    activeIcon: Icon(Icons.bookmark),
                    label: 'WATCHLIST',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    activeIcon: Icon(Icons.person),
                    label: 'PROFILE',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
