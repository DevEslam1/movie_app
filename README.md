# Movie App

A beautiful, high-performance Flutter application for exploring and discovering movies. Features smooth animations, an elegant dark theme with amber accents, and an intuitive user interface.

> **📚 Educational App**: This is an educational project built to demonstrate Flutter best practices including state management, animations, responsive design, and performance optimization.

## Features

### 🎬 Core Functionality
- **Movie Listing**: Browse a comprehensive list of movies with key information
- **Movie Details**: View detailed information about each movie including:
  - Title, year, and IMDb rating
  - Director, actors, and plot summary
  - Multiple poster images in a carousel
- **Movie Gallery**: Interactive gallery with full-screen image viewer and pinch-to-zoom capability

### 🎨 Design & UX
- **Modern Dark Theme**: Sleek dark interface with amber accents for better visual hierarchy
- **Material 3 Design**: Latest Material Design 3 guidelines implementation
- **Responsive Layout**: Optimized for all screen sizes and orientations

### ⚡ Performance
- **Efficient State Management**: Provider pattern with optimized Consumer widgets
- **Image Optimization**: FadeInImage with transparent image placeholders for smooth loading
- **Smooth Transitions**: AnimatedSwitcher and Hero animations for seamless navigation
- **Lazy Loading**: ListView with efficient item rendering

### 🎭 Animations
- **Tap Animations**: Scale and elevation animations on card interaction
- **Page Transitions**: Smooth fade animations between screens
- **Hero Animations**: Connected animations for poster images
- **Loading States**: Animated transitions between loading, error, and content states
- **Scroll Physics**: Bouncing scroll physics for natural feel

## Screenshots
<img width="1344" height="2992" alt="Screenshot_1768865174" src="https://github.com/user-attachments/assets/e14c3f42-a165-42f6-9fb1-8e2f5d44e2ce" />
<img width="1344" height="2992" alt="Screenshot_1768865186" src="https://github.com/user-attachments/assets/0115e51b-5096-49be-beeb-eac3c1a7331e" />

## Getting Started

### Prerequisites
- Flutter 3.4.3 or higher
- Dart 3.4.3 or higher
- Visual Studio (for Windows development) or Xcode (for iOS)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd movie_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate app icons** (if needed)
   ```bash
   flutter pub run flutter_launcher_icons
   ```

### Running the App

**Android/iOS:**
```bash
flutter run
```

**Web:**
```bash
flutter run -d chrome
```

**Windows:**
```bash
flutter run -d windows
```

## Dependencies

- **flutter**: Core Flutter framework
- **provider**: State management (^6.1.5+1)
- **transparent_image**: Placeholder images for FadeInImage
- **flutter_launcher_icons**: App icon generation
- **cupertino_icons**: iOS style icons

## Theme

The app uses a custom dark theme with:
- **Primary Color**: Amber (#FFC107)
- **Background**: Very Dark Gray (#121212)
- **Surface**: Dark Gray (#1f1f1f)
- **AppBar**: Darker Gray (#1a1a1a)

## Usage

### Browsing Movies
1. Launch the app to see the movie list
2. Tap on any movie card to view detailed information

### Viewing Details
- Scroll through the details page to see plot, actors, and director
- Swipe horizontally through the poster gallery
- Tap any poster to view it in full-screen with zoom capability

## Performance Tips

- Images are loaded with fade-in animation for smooth visual experience
- Transparent image placeholders prevent layout jank
- Hero animations create connected visual transitions
- AnimatedSwitcher provides smooth state transitions
- BouncingScrollPhysics enhances scroll experience

## Future Enhancements

- Search and filter functionality
- Favorite/watchlist feature
- User ratings and reviews
- Movie recommendations
- Dark/Light theme toggle
- Multiple language support

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Provider Package Documentation](https://pub.dev/packages/provider)
- [Material Design 3](https://m3.material.io/)

## License

This project is licensed under the MIT License - see LICENSE file for details.
