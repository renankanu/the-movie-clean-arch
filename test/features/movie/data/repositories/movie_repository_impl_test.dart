import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_clean_arch/core/errors/exception.dart';
import 'package:the_movie_clean_arch/core/errors/failure.dart';
import 'package:the_movie_clean_arch/features/movie/data/datasource/remote_data_source.dart';
import 'package:the_movie_clean_arch/features/movie/data/models/models.dart';
import 'package:the_movie_clean_arch/features/movie/repositories/movie_repository_impl.dart';

import 'movie_repository_impl_test.mocks.dart';

@GenerateMocks([RemoteDataSource])
void main() {
  late MovieRepositoryImpl movieRepository;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(
    () {
      mockRemoteDataSource = MockRemoteDataSource();
      movieRepository =
          MovieRepositoryImpl(remoteDataSource: mockRemoteDataSource);
    },
  );

  group('get movie', () {
    const tMovieModel = MovieModel(
      name: 'Movie Test',
      image: '',
      popularity: 92.1,
      voteCount: 1000,
    );

    const tMovieEntity = tMovieModel;

    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      //arrange
      when(mockRemoteDataSource.getMovie())
          .thenAnswer((_) async => tMovieModel);
      //act
      final result = await movieRepository.getMovie();
      //assert
      verify(mockRemoteDataSource.getMovie());
      expect(result, equals(const Right(tMovieEntity)));
    });

    test(
        'should return serve failure when the call to remote data source is unsuccessful',
        () async {
      //arrange
      when(mockRemoteDataSource.getMovie()).thenThrow(ServerException());
      //act
      final result = await movieRepository.getMovie();
      //assert
      verify(mockRemoteDataSource.getMovie());
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test('should return connection failure when the device has no internet',
        () async {
      //arrange
      when(mockRemoteDataSource.getMovie())
          .thenThrow(const SocketException('Failed to connect to the network'));
      //act
      final result = await movieRepository.getMovie();
      //assert
      verify(mockRemoteDataSource.getMovie());
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the network'))));
    });
  });
  group('get similar', () {
    const tSimilarModels = [
      SimilarModel(
        name: 'Similar Test',
        image: '',
        description: 'Similar Description Test',
      )
    ];

    const tSimilarEntity = tSimilarModels;

    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      //arrange
      when(mockRemoteDataSource.getSimilar())
          .thenAnswer((_) async => tSimilarModels);
      //act
      final result = await movieRepository.getSimilar();
      //assert
      verify(mockRemoteDataSource.getSimilar());
      expect(result, equals(const Right(tSimilarEntity)));
    });

    test(
        'should return serve failure when the call to remote data source is unsuccessful',
        () async {
      //arrange
      when(mockRemoteDataSource.getSimilar()).thenThrow(ServerException());
      //act
      final result = await movieRepository.getSimilar();
      //assert
      verify(mockRemoteDataSource.getSimilar());
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test('should return connection failure when the device has no internet',
        () async {
      //arrange
      when(mockRemoteDataSource.getSimilar())
          .thenThrow(const SocketException('Failed to connect to the network'));
      //act
      final result = await movieRepository.getSimilar();
      //assert
      verify(mockRemoteDataSource.getSimilar());
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the network'))));
    });
  });
}
