import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_clean_arch/features/movie/data/models/models.dart';
import 'package:the_movie_clean_arch/features/movie/domain/entities/entities.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tMovieModel = MovieModel(
    name: 'Movie Test',
    image: '',
    popularity: 92.1,
    voteCount: 1000,
  );
  test('should be a subclass of Movie Entity', () {
    //assert
    expect(tMovieModel, isA<MovieEntity>());
  });

  group('fromJson', () {
    test('should return the movie model by JSON', () {
      //arrange
      final jsonMap = json.decode(fixture('movie_model.json'));
      //act
      final result = MovieModel.fromJson(jsonMap);
      //assert
      expect(result, equals(tMovieModel));
    });
  });
}
