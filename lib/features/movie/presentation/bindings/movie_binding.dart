import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:the_movie_clean_arch/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:the_movie_clean_arch/features/movie/domain/usecases/get_movie.dart';
import 'package:the_movie_clean_arch/features/movie/domain/usecases/get_similar.dart';

import '../../data/datasource/remote_data_source.dart';
import '../controllers/movie_controller.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => RemoteDataSourceImpl(dioClient: Get.find<Dio>()));
    Get.lazyPut(() => MovieRepositoryImpl(
          remoteDataSource: Get.find<RemoteDataSourceImpl>(),
        ));
    Get.lazyPut(() => GetMovie(
          movieRepository: Get.find<MovieRepositoryImpl>(),
        ));
    Get.lazyPut(() => GetSimilar(
          movieRepository: Get.find<MovieRepositoryImpl>(),
        ));
    Get.lazyPut<MovieController>(
      () => MovieController(
        getMovie: Get.find<GetMovie>(),
        getSimilar: Get.find<GetSimilar>(),
      ),
    );
  }
}
