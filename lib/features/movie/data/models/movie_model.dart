import 'package:the_movie_clean_arch/features/movie/domain/entities/entities.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.name,
    required super.image,
    required super.popularity,
    required super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      name: json['original_title'],
      image: json['poster_path'],
      popularity: json['popularity'],
      voteCount: json['vote_count'],
    );
  }
}
