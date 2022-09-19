import 'package:equatable/equatable.dart';
import 'package:the_movie_clean_arch/feature/movie/domain/entities/similar_entity.dart';

class MovieEntity extends Equatable {
  final String name;
  final String image;
  final double popularity;
  final int voteCount;
  final List<SimilarEntity> similar;

  const MovieEntity({
    required this.name,
    required this.image,
    required this.popularity,
    required this.voteCount,
    required this.similar,
  });

  @override
  List<Object> get props => [
        name,
        image,
        popularity,
        voteCount,
        similar,
      ];
}
