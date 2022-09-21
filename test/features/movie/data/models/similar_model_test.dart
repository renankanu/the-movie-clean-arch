import 'dart:convert';
import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_clean_arch/features/movie/data/models/similar_model.dart';
import 'package:the_movie_clean_arch/features/movie/domain/entities/entities.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tSimilarModel = [
    SimilarModel(
      name: 'Similar Test',
      image: '',
      description: 'Similar Description Test',
    )
  ];

  test('should be a subclass of Similar Entity', () {
    expect(tSimilarModel, isA<List<SimilarEntity>>());
  });

  group('fromJson', () {
    test('should return the similar model by JSON', () {
      //arrange
      final jsonMap = json.decode(fixture('similar_model.json'));
      log(jsonMap.toString());
      //act
      final result = (jsonMap['results'] as List)
          .map((e) => SimilarModel.fromJson(e))
          .toList();
      //assert
      expect(result, equals(tSimilarModel));
    });
  });
}
