import 'package:get/get.dart';
import 'package:the_movie_clean_arch/features/movie/domain/entities/entities.dart';
import 'package:the_movie_clean_arch/features/movie/domain/usecases/get_movie.dart';
import 'package:the_movie_clean_arch/features/movie/domain/usecases/get_similar.dart';

class MovieController extends GetxController {
  MovieController({
    required this.getMovie,
    required this.getSimilar,
  });

  final RxBool _isLoading = RxBool(false);
  final RxBool _hasError = RxBool(false);
  final Rx<MovieEntity?> _movie = Rx<MovieEntity?>(null);
  final Rx<List<SimilarEntity>?> _similar = Rx<List<SimilarEntity>?>(null);

  bool get isLoading => _isLoading.value;
  bool get hasError => _hasError.value;
  MovieEntity? get movie => _movie.value;
  List<SimilarEntity>? get similar => _similar.value;

  final GetMovie getMovie;
  final GetSimilar getSimilar;

  @override
  void onInit() {
    _getMovie();
    super.onInit();
  }

  Future<void> _getMovie() async {
    _isLoading.toggle();

    final movieResult = await getMovie.call();
    final similarResult = await getSimilar.call();

    movieResult.fold(
      (failure) => _hasError.value = true,
      (data) => _movie.value = data,
    );
    similarResult.fold(
      (failure) => _hasError.value = true,
      (data) => _similar.value = data,
    );

    _isLoading.toggle();
  }
}
