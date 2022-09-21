import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:the_movie_clean_arch/core/theme/base_theme.dart';

import 'core/app_routes.dart';

void main() {
  initializeDateFormatting('en', null);
  runApp(
    GetMaterialApp(
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
      theme: baseTheme,
    ),
  );
}
