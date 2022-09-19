import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_clean_arch/features/movie/domain/entities/entities.dart';
import 'package:the_movie_clean_arch/features/movie/domain/repositories/movie_repository.dart';
import 'package:the_movie_clean_arch/features/movie/domain/usecases/get_similar.dart';

import 'get_movie_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository mockMovieRepository;
  late GetSimilar getSimilar;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getSimilar = GetSimilar(movieRepository: mockMovieRepository);
  });

  final tSimilar = [
    const SimilarEntity(
        name: 'Similar Test',
        image: '',
        description: 'Similar Description Test')
  ];

  test('should return similares movies from the repository', () async {
    //arrange
    when(mockMovieRepository.getSimilar())
        .thenAnswer((_) async => Right(tSimilar));
    //act
    final result = await getSimilar();
    //assert
    expect(result, Right(tSimilar));
  });
}
