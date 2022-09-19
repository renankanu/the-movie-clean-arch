import 'package:dartz/dartz.dart';
import 'package:the_movie_clean_arch/core/errors/failure.dart';
import 'package:the_movie_clean_arch/features/movie/domain/entities/similar_entity.dart';
import 'package:the_movie_clean_arch/features/movie/domain/repositories/movie_repository.dart';

class GetSimilar {
  final MovieRepository movieRepository;

  GetSimilar({required this.movieRepository});

  Future<Either<Failure, List<SimilarEntity>>> call() async {
    return await movieRepository.getSimilar();
  }
}
