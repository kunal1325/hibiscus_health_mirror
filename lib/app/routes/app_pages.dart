import '../../import.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.landingScreen;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.onBoarding,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
  ];
}
