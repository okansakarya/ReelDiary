import 'package:equatable/equatable.dart';

/// Model for public.tmdb_movie table (Supabase).
class MovieModal extends Equatable {
  final int tmdbId;
  final String title;
  final String originalTitle;
  final String overview;
  final String? tagline;
  final DateTime? releaseDate;
  final int? runtime;
  final String? status;
  final String? originalLanguage;
  final bool adult;
  final double? voteAverage;
  final int? voteCount;
  final double? popularity;
  final String? posterPath;
  final String? backdropPath;
  final String? imdbId;
  final String? homepage;
  final List<dynamic> genres; // jsonb -> List (e.g. [{"id": 28, "name": "Action"}])
  final DateTime? detailsSyncedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const MovieModal({
    required this.tmdbId,
    required this.title,
    required this.originalTitle,
    required this.overview,
    this.tagline,
    this.releaseDate,
    this.runtime,
    this.status,
    this.originalLanguage,
    this.adult = false,
    this.voteAverage,
    this.voteCount,
    this.popularity,
    this.posterPath,
    this.backdropPath,
    this.imdbId,
    this.homepage,
    List<dynamic>? genres,
    this.detailsSyncedAt,
    required this.createdAt,
    required this.updatedAt,
  }) : genres = genres ?? const [];

  factory MovieModal.fromJson(Map<String, dynamic> json) {
    return MovieModal(
      tmdbId: json['tmdb_id'] as int,
      title: (json['title'] as String?) ?? '',
      originalTitle: (json['original_title'] as String?) ?? '',
      overview: (json['overview'] as String?) ?? '',
      tagline: json['tagline'] as String?,
      releaseDate: json['release_date'] != null
          ? DateTime.tryParse(json['release_date'] as String)
          : null,
      runtime: json['runtime'] as int?,
      status: json['status'] as String?,
      originalLanguage: json['original_language'] as String?,
      adult: (json['adult'] as bool?) ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      imdbId: json['imdb_id'] as String?,
      homepage: json['homepage'] as String?,
      genres: json['genres'] is List ? List<dynamic>.from(json['genres'] as List) : const [],
      detailsSyncedAt: json['details_synced_at'] != null
          ? DateTime.tryParse(json['details_synced_at'] as String)
          : null,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tmdb_id': tmdbId,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'tagline': tagline,
      'release_date': releaseDate?.toIso8601String(),
      'runtime': runtime,
      'status': status,
      'original_language': originalLanguage,
      'adult': adult,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'popularity': popularity,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'imdb_id': imdbId,
      'homepage': homepage,
      'genres': genres,
      'details_synced_at': detailsSyncedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}