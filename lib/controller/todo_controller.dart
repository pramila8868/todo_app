import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/pages/snackbar.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import "package:http/http.dart" as http;
import '../pages/model/user.dart';
import '../pages/shared_prefs.dart';
import '../pages/todo.dart';
import '../pages/url.dart';

class TodoController extends GetxController {
  List<Todo> todos = [];
  //List<Todo> filteredTodo = [];

  late TextEditingController titleController, descriptionController;
  @override
  void onInit() {
    super.onInit();
    fetchMyTodo();
    // addTodo();

    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();

    titleController.dispose();
    descriptionController.dispose();
  }

  fetchMyTodo() async {
    var usr = await SharedPrefs().getUser();
    User user = User.fromJson(json.decode(usr));

    var response = await http.post(Uri.parse("${url}todo_get.php"), body: {
      "userid": user.userId,
      // 'todolist_id': "68",
      //"user_id": "12",
    });
    var res = await json.decode(response.body);
    // ignore: avoid_print
    print(res);
    if (res["success"]) {
      todos = AllTodo.fromJson(res).todo!;
      //filteredTodo = AllTodo.fromJson(res).todo!;

      update();
    } else {
      customSnackBar("Error", "Failed to fetch todos", "error");
    }
  }

  addTodo() async {
    var usr = await SharedPrefs().getUser();
    User user = User.fromJson(json.decode(usr));

    var response = await http.post(Uri.parse("${url}todo_add.php"), body: {
      "userid": user.userId,

      //  "user_id": "21",
      'title': titleController.text,
      'todo': descriptionController.text,
      //'todo_note': descriptionController.text,
    });
    var res = await json.decode(response.body);

    // ignore: avoid_print
    print(res);

    if (res["success"]) {
      customSnackBar("success", res['message'], "success");
      // todos = AllTodo.fromJson(res).todo!;
      //filteredTodo = AllTodo.fromJson(res).todo!;
      titleController.text = "";
      descriptionController.text = "";

      fetchMyTodo();
    } else {
      customSnackBar("Error", res['message'], "error");
    }
    update();
  }

  editTodo(todolistId) async {
    var usr = await SharedPrefs().getUser();
    User user = User.fromJson(json.decode(usr));

    var response = await http.post(Uri.parse("${url}todo_edit.php"), body: {
      "todoid": todolistId,
      "userid": user.userId,
      'title': titleController.text,
      'todo': descriptionController.text,
      //'todo_note': descriptionController.text,
    });
    var res = await json.decode(response.body);

    // ignore: avoid_print
    print(res);

    if (res["success"]) {
      customSnackBar("success", res['message'], "success");
      // todos = AllTodo.fromJson(res).todo!;
      //filteredTodo = AllTodo.fromJson(res).todo!;
      titleController.text = "";
      descriptionController.text = "";

      fetchMyTodo();
    } else {
      customSnackBar("Error", res['message'], "error");
    }
    update();
  }

  deleteTodo(todolistId) async {
    var usr = await SharedPrefs().getUser();
    User user = User.fromJson(json.decode(usr));

    var response = await http.post(Uri.parse("${url}todo_delete.php"), body: {
      "todoid": todolistId,
      "userid": user.userId,

      //'todo_note': descriptionController.text,
    });
    var res = await json.decode(response.body);

    // ignore: avoid_print
    print(res);

    if (res["success"]) {
      customSnackBar("success", res['message'], "success");
      // todos = AllTodo.fromJson(res).todo!;
      //filteredTodo = AllTodo.fromJson(res).todo!;

      fetchMyTodo();
    } else {
      customSnackBar("Error", res['message'], "error");
    }
    update();
  }
}
