import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/movie_dto.dart';

class LocalMovieDatasource {
  static const String _assetPath = 'assets/data/films.json';

  Future<List<MovieDto>> getMovies() async {
    try {
      final String response = await rootBundle.loadString(_assetPath);
      final List<dynamic> data = json.decode(response);
      return data.map((json) => MovieDto.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }
}
