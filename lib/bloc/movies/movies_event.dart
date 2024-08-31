part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable{

  @override
  List<Object> get props => [];
}

class MoviesFetched extends MoviesEvent {
  final int page;
  MoviesFetched({required this.page});

  @override
  List<Object> get props => [page];
}
