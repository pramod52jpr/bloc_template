part of 'movies_bloc.dart';


class MoviesState extends Equatable{
  const MoviesState({
    required this.moviesList,
    this.lastPage = 0,
    this.tvShows = const [],
});
  final ApiResponse<MoviesModel> moviesList;
  final List<TvShows> tvShows;
  final int lastPage;

  MoviesState copyWith({ApiResponse<MoviesModel>? moviesList, int? lastPage, List<TvShows>? tvShows}){
    return MoviesState(
        moviesList: moviesList ?? this.moviesList,
      lastPage: lastPage ?? this.lastPage,
      tvShows: tvShows != null ? [...this.tvShows, ...tvShows] : this.tvShows,
    );
  }

  @override
  List<Object> get props => [moviesList];

}