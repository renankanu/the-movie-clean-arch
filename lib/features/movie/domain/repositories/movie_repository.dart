import 'package:dartz/dartz.dart';
import 'package:the_movie_clean_arch/features/movie/domain/entities/entities.dart';

import '../../../../core/errors/failure.dart';

abstract class MovieRepository {
  Future<Either<Failure, MovieEntity>> getMovie();
  Future<Either<Failure, List<SimilarEntity>>> getSimilar();
}
