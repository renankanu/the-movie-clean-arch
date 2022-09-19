import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_clean_arch/features/movie/domain/entities/entities.dart';
import 'package:the_movie_clean_arch/features/movie/domain/repositories/movie_repository.dart';
import 'package:the_movie_clean_arch/features/movie/domain/usecases/get_movie.dart';

import 'get_movie_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MockMovieRepository mockMovieRepository;
  late GetMovie getMovie;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getMovie = GetMovie(movieRepository: mockMovieRepository);
  });

  const tMovie = MovieEntity(
      name: 'Movie Test',
      image: '',
      popularity: 100,
      voteCount: 1000,
      similar: [
        SimilarEntity(
          name: 'Movie Test II',
          image: '',
          description: 'Description Test',
        )
      ]);

  test('should one movie from the repository', () async {
    //arrange
    when(mockMovieRepository.getMovie())
        .thenAnswer((_) async => const Right(tMovie));
    //act
    final result = await getMovie();
    //assert
    expect(result, const Right(tMovie));
  });
}
