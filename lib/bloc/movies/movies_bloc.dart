import 'package:bloc/bloc.dart';
import 'package:bloc_template/data/response/api_response.dart';
import 'package:bloc_template/models/movies/movies.dart';
import 'package:bloc_template/repository/movies/movies_repository.dart';
import 'package:equatable/equatable.dart';

part 'movies_event.dart';
part 'movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState>{
  MoviesRepository moviesRepository;
  MoviesBloc({required this.moviesRepository}) : super(MoviesState(moviesList: ApiResponse.loading())){
    on<MoviesFetched>(fetchMoviesListApi);
  }

  Future<void> fetchMoviesListApi(MoviesFetched event, Emitter<MoviesState> emit)async{
    if(event.page == 1){
      emit(state.copyWith(moviesList: ApiResponse.loading()));
    }
    await moviesRepository.fetchMoviesList(event.page).then((value) {
      emit(state.copyWith(moviesList: ApiResponse.completed(value), lastPage: event.page, tvShows: value.tvShows));
    }).onError((error, stackTrace) {
      emit(state.copyWith(moviesList: ApiResponse.error(error.toString()), lastPage: event.page-1));
    });
  }

}