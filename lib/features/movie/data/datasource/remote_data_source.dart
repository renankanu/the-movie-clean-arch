import 'package:dio/dio.dart';
import 'package:the_movie_clean_arch/core/errors/exception.dart';
import 'package:the_movie_clean_arch/features/movie/data/models/models.dart';

import '../../../../core/constants/urls_constant.dart';

abstract class RemoteDataSource {
  Future<MovieModel> getMovie();
  Future<List<SimilarModel>> getSimilar();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dioClient;

  RemoteDataSourceImpl({required this.dioClient});
  @override
  Future<MovieModel> getMovie() async {
    final response = await dioClient.get(Urls.moviePath);
    if (response.statusCode == 200) {
      return MovieModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SimilarModel>> getSimilar() async {
    final response = await dioClient.get(Urls.similarPath);
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => SimilarModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
