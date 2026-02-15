import 'package:movieapp/data/modals/movie_model.dart';
import 'package:movieapp/data/modals/movie_spec_modal.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MovieService {
  final _supabase = Supabase.instance.client;

  Future<List<MovieModal>> getAllMovies() async {
    try {
      final movieList = await _supabase.from('tmdb_movie').select('''' 
      tmdb_id,
      title,
      original_title,
      overview,
      tagline,
      release_date,
      runtime,
      status,
      original_language,
      adult,
      vote_average, 
      vote_count,
      popularity, 
      poster_path,
      backdrop_path,
      imdb_id,
      homepage,
      genres,
      details_synced_at 
      ''');

      return (movieList as List)
          .map((e) => MovieModal.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieSpecModal>> getHomePageMovies() async {
    try {
      final homePageMovies = await _supabase
          .from('tmdb_movie_list_item')
          .select('''
      list_type, 
      movie_id,
      tmdb_movie (
        title, 
        poster_path, 
        backdrop_path,
        release_date
      )
      ''');

      print(homePageMovies);


      return (homePageMovies as List)
          .map((e) => MovieSpecModal.fromJson(e as Map<String, dynamic>))
          .toList();

    } catch (e) {
      rethrow;
    }
  }

}
