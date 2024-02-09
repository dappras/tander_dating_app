import 'package:dating_app_clone/pages/home.dart';
import 'package:dating_app_clone/pages/likes.dart';
import 'package:dating_app_clone/pages/login.dart';
import 'package:dating_app_clone/pages/profile.dart';
import 'package:dating_app_clone/pages/splash_screen.dart';
import 'package:dating_app_clone/pages/welcome.dart';
import 'package:dating_app_clone/routes/route_name.dart';
import 'package:get/get.dart';

class AppRoute {
  static final pages = [
    GetPage(name: RouteName.welcomePage, page: () => const WelcomePage()),
    GetPage(name: RouteName.loginPage, page: () => const LoginPage()),
    GetPage(name: RouteName.homePage, page: () => const HomePage()),
    GetPage(name: RouteName.likePage, page: () => const LikesPage()),
    GetPage(name: RouteName.profilePage, page: () => const ProfilePage()),
    GetPage(
        name: RouteName.splashScreenPage, page: () => const SplashScreenPage()),
  ];
}
