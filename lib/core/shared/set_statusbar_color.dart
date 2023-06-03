import 'package:flutter/services.dart';

import '../../../data/helpers/cache_helper.dart';
import '../colors_manager.dart';

void setStatusbarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: CacheHelper.getDarkMode == null
          ? ColorsManager.white
          : (CacheHelper.getDarkMode!)
              ? ColorsManager.darkModeColor
              : ColorsManager.white,
      statusBarIconBrightness: CacheHelper.getDarkMode == null
          ? Brightness.dark
          : (CacheHelper.getDarkMode!)
              ? Brightness.light
              : Brightness.dark,
    ),
  );
}
