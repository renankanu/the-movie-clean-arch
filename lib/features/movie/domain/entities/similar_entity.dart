import 'package:equatable/equatable.dart';

class SimilarEntity extends Equatable {
  final String name;
  final String image;
  final String description;

  const SimilarEntity({
    required this.name,
    required this.image,
    required this.description,
  });

  @override
  List<Object> get props => [
        name,
        image,
        description,
      ];
}
