import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/data/repository/movie_repository.dart';
import 'package:movieapp/presentation/pages/homePage/components/state/home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this._movieRepository) : super(HomePageInitiliaze());

  final MovieRepository _movieRepository;

  Future<void> getHomePageMovies() async {
    try {
      emit(HomePageLoading());
      final homePageMovies = await _movieRepository.getHomePageMovies();
      emit(HomePageLoaded(homePageMovies));
    } catch (e) {
      emit(HomePageError(e.toString()));
    }
  }
}
