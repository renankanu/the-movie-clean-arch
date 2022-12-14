import 'package:dartz/dartz.dart';
import 'package:the_movie_clean_arch/core/errors/failure.dart';
import 'package:the_movie_clean_arch/features/movie/domain/entities/entities.dart';
import 'package:the_movie_clean_arch/features/movie/domain/repositories/movie_repository.dart';

class GetMovie {
  GetMovie({required this.movieRepository});

  final MovieRepository movieRepository;

  Future<Either<Failure, MovieEntity>> call() async {
    return await movieRepository.getMovie();
  }
}
