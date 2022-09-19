import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String name;
  final String image;
  final double popularity;
  final int voteCount;

  const MovieEntity({
    required this.name,
    required this.image,
    required this.popularity,
    required this.voteCount,
  });

  @override
  List<Object> get props => [
        name,
        image,
        popularity,
        voteCount,
      ];
}
