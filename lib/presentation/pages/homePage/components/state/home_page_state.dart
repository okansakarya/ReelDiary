import 'package:movieapp/data/modals/movie_model.dart';
import 'package:movieapp/data/modals/movie_spec_modal.dart';

abstract class HomePageState {}

class HomePageInitiliaze extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final List<MovieSpecModal> movieList;

  HomePageLoaded(this.movieList);
}

class HomePageError extends HomePageState {
  final String error;

  HomePageError(this.error);
}
