import 'package:the_movie_clean_arch/features/movie/domain/entities/entities.dart';

class SimilarModel extends SimilarEntity {
  const SimilarModel({
    required super.name,
    required super.image,
    required super.description,
  });

  factory SimilarModel.fromJson(Map<String, dynamic> json) {
    return SimilarModel(
      name: json['original_title'],
      image: json['poster_path'],
      description: json['release_date'],
    );
  }
}
