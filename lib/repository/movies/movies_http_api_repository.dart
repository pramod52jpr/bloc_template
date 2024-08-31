import 'package:bloc_template/config/app_url.dart';
import 'package:bloc_template/data/network/network_api_services.dart';
import 'package:bloc_template/models/movies/movies.dart';
import 'package:bloc_template/repository/movies/movies_repository.dart';

class MoviesHttpApiRepository implements MoviesRepository{
  final NetworkApiServices _apiServices = NetworkApiServices();

  @override
  Future<MoviesModel> fetchMoviesList(int page) async{
    final response = await _apiServices.getRequest("${AppUrl.moviesListUrl}$page");
    return MoviesModel.fromJson(response);
  }

}