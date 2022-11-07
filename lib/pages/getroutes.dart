import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/list_item_page.dart';
import 'package:flutter_application_1/pages/signin_page.dart';
//import 'package:flutter_application_1/pages/todo.dart';
import 'package:get/get.dart';

class GetRoutes {
  static const String login = "/login";
  static const String signup = "/signup";
  static const String home = "/home";

  static List<GetPage> routes = [
    GetPage(
      name: GetRoutes.login,
      page: () => SigninPage(),
    ),
    GetPage(
      name: GetRoutes.signup,
      page: () => HomePage(),
    ),
    GetPage(
      name: GetRoutes.home,
      page: () => ListItem(),
    ),
  ];
}
