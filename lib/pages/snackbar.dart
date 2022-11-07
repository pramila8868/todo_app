import 'package:flutter/material.dart';

import 'package:get/get.dart';

customSnackBar(title, message, type) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: type == "error" ? Colors.purple : Colors.green,
      colorText: Colors.white);
}
