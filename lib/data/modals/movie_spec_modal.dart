import 'package:equatable/equatable.dart';

/// Popüler , vizyonda , Vs gibi ana sayfada listelenen filmlerin modeli
///
///

class MovieSpecModal extends Equatable {
  const MovieSpecModal({
    required this.movie_name,
    required this.movie_id,
    required this.list_type,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
  });

  final String list_type;
  final int movie_id;
  final String movie_name;
  final String? posterPath;
  final String? backdropPath;
  final DateTime? releaseDate;

  factory MovieSpecModal.fromJson(Map<String, dynamic> json) {
    final rawId = json['movie_id'] ?? json['tmdb_id'];
    final movieId = (rawId is num) ? rawId.toInt() : 0;

    final movie = json['tmdb_movie'] is Map<String, dynamic>
        ? json['tmdb_movie'] as Map<String, dynamic>
        : null;

    final titleRaw = movie?['title'] ?? json['title'];
    final movieName = (titleRaw is String) ? titleRaw : '';

    final posterRaw = movie?['poster_path'] ?? json['poster_path'];
    final posterPath = posterRaw is String ? posterRaw : null;

    final backdropRaw = movie?['backdrop_path'] ?? json['backdrop_path'];
    final backdropPath = backdropRaw is String ? backdropRaw : null;

    final dateRaw = movie?['release_date'] ?? json['release_date'];
    final releaseDate = dateRaw != null
        ? DateTime.tryParse(dateRaw.toString())
        : null;

    final listTypeRaw = json['list_type'];
    final listType = listTypeRaw is String ? listTypeRaw : '';

    return MovieSpecModal(
      movie_id: movieId,
      movie_name: movieName,
      list_type: listType,
      posterPath: posterPath,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  List<Object?> get props => [];
}
