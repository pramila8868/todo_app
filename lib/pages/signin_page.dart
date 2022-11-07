import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import 'background.dart';
import 'home_page.dart';
//import 'package:todo_app1/controller/login_controller.dart';
//import 'package:todo_app1/home_page.dart';
//import 'package:todo_app1/pages/background.dart';
//import 'list_item_page.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);

  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
            child: GetBuilder<LoginController>(builder: (controller) {
              return Column(
                // mainAxisAlignment: Ma,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 140, left: 40),
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    child: Opacity(
                      opacity: 0.8,
                      child: Container(
                        height: 350,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28)),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(14.0),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                // ,fontFamily:""
                              ),
                              TextFormField(
                                controller: controller.emailController,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: 'Email address',

                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purple, width: 2.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                  //  labelText: "Email Address"
                                ),
                              ),
                              TextFormField(
                                controller: controller.passwordController,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  hintText: 'Password',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purple, width: 2.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  controller.checkLogin();
                                },
                                //   Navigator.push(context, MaterialPageRoute(builder: (context)=> ListItem()));

                                // ignore: sort_child_properties_last
                                child: const Text(
                                  "Log In ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.purple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("New user?"),
                                  TextButton(
                                      onPressed: () {
                                        // Get.to(HomePage())
                                        //   Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //           builder: (context) =>
                                        //               HomePage()));
                                        Get.to(HomePage());
                                      },
                                      child: const Text("Sign Up "))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}
