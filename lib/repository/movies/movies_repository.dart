import 'package:bloc_template/models/movies/movies.dart';

abstract class MoviesRepository{
  Future<MoviesModel> fetchMoviesList(int page);
}