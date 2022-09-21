import 'package:get/route_manager.dart';
import 'package:the_movie_clean_arch/features/movie/presentation/bindings/movie_binding.dart';
import 'package:the_movie_clean_arch/features/movie/presentation/views/movie_view.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/home';
}

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const MovieView(),
      binding: MovieBinding(),
    ),
  ];
}
