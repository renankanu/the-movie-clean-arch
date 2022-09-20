import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_clean_arch/core/errors/exception.dart';
import 'package:the_movie_clean_arch/features/movie/data/datasource/remote_data_source.dart';
import 'package:the_movie_clean_arch/features/movie/data/models/movie_model.dart';
import 'package:the_movie_clean_arch/features/movie/data/models/similar_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late RemoteDataSourceImpl remoteDataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    remoteDataSource = RemoteDataSourceImpl(dioClient: mockDio);
  });

  group('get movie', () {
    final tJson = json.decode(fixture('movie_model.json'));
    final tMovieModel = MovieModel.fromJson(tJson);
    test('should return movie model when the response code is 200', () async {
      //arrange
      when(mockDio.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => Response(
                data: tJson,
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ));
      //act
      final result = await remoteDataSource.getMovie();
      //assert
      expect(result, equals(tMovieModel));
    });

    test(
        'should throw a server exception when the response code is 404 or other',
        () async {
      //arrange
      when(mockDio.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => Response(
                statusCode: 404,
                requestOptions: RequestOptions(path: ''),
              ));
      //act
      final result = remoteDataSource.getMovie();
      //assert
      expect(() => result, throwsA(isInstanceOf<ServerException>()));
    });
  });
  group('get similar', () {
    final tJson = json.decode(fixture('similar_model.json'));
    final tSimilarModels = (tJson['results'] as List)
        .map((e) => SimilarModel.fromJson(e))
        .toList();
    test('should return similar model when the response code is 200', () async {
      //arrange
      when(mockDio.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => Response(
                data: tJson,
                statusCode: 200,
                requestOptions: RequestOptions(path: ''),
              ));
      //act
      final result = await remoteDataSource.getSimilar();
      //assert
      expect(result, equals(tSimilarModels));
    });

    test(
        'should throw a server exception when the response code is 404 or other',
        () async {
      //arrange
      when(mockDio.get(any, options: anyNamed('options')))
          .thenAnswer((_) async => Response(
                statusCode: 404,
                requestOptions: RequestOptions(path: ''),
              ));
      //act
      final result = remoteDataSource.getSimilar();
      //assert
      expect(() => result, throwsA(isInstanceOf<ServerException>()));
    });
  });
}
