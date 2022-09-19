import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:the_movie_clean_arch/core/errors/exception.dart';
import 'package:the_movie_clean_arch/core/errors/failure.dart';
import 'package:the_movie_clean_arch/features/movie/data/datasource/remote_data_source.dart';
import 'package:the_movie_clean_arch/features/movie/domain/entities/movie_entity.dart';
import 'package:the_movie_clean_arch/features/movie/domain/entities/similar_entity.dart';
import 'package:the_movie_clean_arch/features/movie/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl({required this.remoteDataSource});

  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, MovieEntity>> getMovie() async {
    try {
      return Right(await remoteDataSource.getMovie());
    } on ServerException {
      return Left(ServerFailure('Server Failure in Get Movie'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<SimilarEntity>>> getSimilar() async {
    try {
      return Right(await remoteDataSource.getSimilar());
    } on ServerException {
      return Left(ServerFailure('Server Failure in Get Similar'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
