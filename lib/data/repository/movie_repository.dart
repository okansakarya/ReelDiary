import 'package:movieapp/data/modals/movie_model.dart';
import 'package:movieapp/data/modals/movie_spec_modal.dart';
import 'package:movieapp/data/services/movie_service.dart';

class MovieRepository {
  MovieRepository(this._movieService);

  /// Auth Service Object
  final MovieService _movieService;

  Future<List<MovieModal>> getAllMovies() async {
    try {
      final movieList = await _movieService.getAllMovies();
      return movieList;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MovieSpecModal>> getHomePageMovies() async {
    try {
      final homePageMovies = await _movieService.getHomePageMovies();

      return homePageMovies;
    } catch (e) {
      rethrow;
    }
  }
}
