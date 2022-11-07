import 'dart:convert';
import 'package:flutter_application_1/pages/url.dart';
// ignore: depend_on_referenced_packages
import "package:http/http.dart" as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../pages/list_item_page.dart';
import '../pages/loadingwidget.dart';
import '../pages/model/user.dart';
import '../pages/shared_prefs.dart';
import '../pages/snackbar.dart';

class LoginController extends GetxController {
  late TextEditingController emailController, passwordController;

  @override
  void onInit() {
    super.onInit();
    checkUser();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  checkUser() async {
    var user = SharedPrefs().getUser();
    if (user != null) {
      //Get.offAllNamed(GetRoutes.home);
      //Get.to(list_item_page);
      Get.to(ListItem());
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  checkLogin() {
    if (emailController.text.isEmpty ||
        GetUtils.isEmail(emailController.text) == false) {
      customSnackBar("Error", "Valid email is required", "error");
    } else if (passwordController.text.isEmpty) {
      customSnackBar("Error", "Password is required", "error");
    } else {
      Get.showOverlay(
          asyncFunction: () => login(), loadingWidget: const LoadingWidget());
    }
  }

  login() async {
    var response = await http.post(Uri.parse("${url}login.php"), body: {
      "email": emailController.text,
      "password": passwordController.text,
    });
    var res = await json.decode(response.body);

    if (res["success"]) {
      customSnackBar("success", res["message"], "success");
      User user = User.fromJson(res['user']);
      SharedPrefs().storeUser(json.encode(user));

      //  Get.to(ListItem(todo: null,));
      Get.to(ListItem());
      //Get.offAllNamed(GetRoutes.home);
    } else {
      customSnackBar("Error", res["message"], "error");
    }
  }
}
