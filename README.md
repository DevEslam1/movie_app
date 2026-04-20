# CineCurator 🎬

A premium, high-performance Flutter application for exploring and discovering movies. Built with **Clean Architecture** and **SOLID Principles**, this app features a sleek, "Cinematic Stream" dark theme inspired by high-end streaming platforms.

## 🌟 Key Features

### 🎬 Core Experience
- **Cinematic Home**: A massive "Now Playing" hero section with immersive gradients and metadata.
- **Deep Exploration**: Discover movies via genres, trending lists, and categories.
- **Smart Search**: Find movies, actors, or directors instantly with live filtering.
- **Watchlist**: Save your must-watch movies locally for later.
- **Mock Video Player**: A high-fidelity playback simulation with animated controls and 4K metadata.
- **Full-Screen Gallery**: Immersive movie stills viewer with interactive zoom.

### 🎨 Design & UX (CineCurator Design System)
- **Deep Navy Palette**: A premium, dark interface optimized for low-light viewing.
- **Vibrant Blue Accents**: High-contrast highlights for active categories and actions.
- **Glassmorphism**: Translucent, blurred navigation bars and overlays.
- **Responsive Grid**: Optimized 3-column layout for information-dense browsing.
- **Micro-Animations**: Smooth Hero transitions, fade-ins, and loading shimmers.

---

## 🏗️ Architecture & Technical Stack

This project follows **Clean Architecture** to ensure scalability, testability, and separation of concerns.

### 📂 Layered Structure
- **Domain Layer**: Pure business logic (Entities, Repositories, Use Cases).
- **Data Layer**: Data retrieval and mapping (Repository Impls, Datasources, DTOs).
- **Presentation Layer**: UI and State Management (Providers, Screens, Widgets).
- **Core Layer**: Shared utilities, theme tokens, and constants.

### 🛠️ Tech Stack
- **Flutter**: UI Framework.
- **Provider**: State Management.
- **Google Fonts**: Modern typography (Inter/Roboto).
- **CachedNetworkImage**: Efficient image loading and caching.
- **Shimmer**: Premium loading states.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `^3.4.3`
- Dart SDK `^3.4.3`

### Installation & Run

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd movie_app
   ```

2. **Setup dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   # Android/iOS
   flutter run
   
   # Windows Desktop
   flutter run -d windows
   ```

---

## 📸 Screenshots
*(Screenshots coming soon after final UI polishing)*

## 📄 License
This project is licensed under the MIT License.
