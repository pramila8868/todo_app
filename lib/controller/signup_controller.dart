import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/signin_page.dart';
import 'package:get/get.dart';

// ignore: depend_on_referenced_packages
import "package:http/http.dart" as http;

import '../pages/loadingwidget.dart';
import '../pages/snackbar.dart';
import '../pages/url.dart';

class SignupController extends GetxController {
  late TextEditingController nameController,
      emailController,
      passwordController,
      conformPasswordController,
      genderController;

  @override
  void onInit() {
    //
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    conformPasswordController = TextEditingController();
    genderController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    conformPasswordController.dispose();
  }

  checkSignup() {
    if (nameController.text.isEmpty) {
      customSnackBar("Error", "Name is required", "error");
    } else if (emailController.text.isEmpty ||
        GetUtils.isEmail(emailController.text) == false) {
      customSnackBar("Error", "Valid email is required", "error");
    } else if (passwordController.text.isEmpty) {
      customSnackBar("Error", "Password is required", "error");
    } else if (passwordController.text != conformPasswordController.text) {
      customSnackBar("Error", "Password does not match", "error");
    } else {
      Get.showOverlay(
          asyncFunction: () => signin(), loadingWidget: const LoadingWidget());
    }
  }

  signin() async {
    var response = await http.post(Uri.parse("${url}signup.php"), body: {
      "user_name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "gender": "female"
    });
    var res = await json.decode(response.body);

    if (res["success"]) {
      customSnackBar("success", res['message'], "success");
      // Get.offAllNamed(GetRoutes.login);

      Get.to(SigninPage());
    } else {
      customSnackBar("Error", res["message"], "error");
    }
  }
}
