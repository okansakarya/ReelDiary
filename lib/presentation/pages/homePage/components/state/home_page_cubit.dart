import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/data/modals/movie_spec_modal.dart';
import 'package:movieapp/data/repository/movie_repository.dart';
import 'package:movieapp/presentation/pages/homePage/components/state/home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this._movieRepository) : super(HomePageInitiliaze());

  final MovieRepository _movieRepository;

  List<MovieSpecModal>? _allMovies;

  Future<void> getHomePageMovies() async {
    try {
      emit(HomePageLoading());
      final homePageMovies = await _movieRepository.getHomePageMovies();
      _allMovies = homePageMovies;
      emit(HomePageLoaded(homePageMovies));
    } catch (e) {
      emit(HomePageError(e.toString()));
    }
  }

  void searchMovie(String query) {
    if (_allMovies == null) return;
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      emit(HomePageLoaded(_allMovies!));
      return;
    }
    final lower = trimmed.toLowerCase();
    final filtered = _allMovies!
        .where(
          (movie) => movie.movie_name.toLowerCase().contains(lower),
        )
        .toList();
    emit(HomePageLoaded(filtered));
  }
}
