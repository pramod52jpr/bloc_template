import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies.freezed.dart';
part 'movies.g.dart';

@freezed
class MoviesModel with _$MoviesModel{
  factory MoviesModel({
    @Default('') String total,
    @Default(0) int page,
    @Default(0) int pages,
    @Default([]) @JsonKey(name: 'tv_shows') List<TvShows> tvShows
}) = _MoviesModel;

  factory MoviesModel.fromJson(Map<String, dynamic> json) => _$MoviesModelFromJson(json);
}

@freezed
class TvShows with _$TvShows{
  factory TvShows({
    @Default(0) int id,
    @Default('') String name,
    @Default('') @JsonKey(name: 'start_date') String startDate,
    @Default('') @JsonKey(name: 'end_date') String endDate,
    @Default('') String country,
    @Default('') String network,
    @Default('') String status,
    @Default('') @JsonKey(name: 'image_thumbnail_path') String imageThumbnailPath
  }) = _TvShows;

  factory TvShows.fromJson(Map<String, dynamic> json) => _$TvShowsFromJson(json);
}