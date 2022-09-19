import 'package:equatable/equatable.dart';

class SimilarEntity extends Equatable {
  const SimilarEntity({
    required this.name,
    required this.image,
    required this.description,
  });

  final String name;
  final String image;
  final String description;

  @override
  List<Object> get props => [
        name,
        image,
        description,
      ];
}
