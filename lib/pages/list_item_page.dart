// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/todo_controller.dart';
import 'package:flutter_application_1/pages/list.dart';
import 'package:flutter_application_1/pages/textfield.dart';
//import 'package:flutter_application_1/pages/todo.dart';
import 'package:get/get.dart';
// ignore: unnecessary_import
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'loadingwidget.dart';
//import 'package:google_fonts/google_fonts.dart';

class ListItem extends StatelessWidget {
  //final Todo? todos;
  ListItem({
    Key? key,
  }) : super(key: key);
  final todoController = Get.put(TodoController());
  // List<String> text=["Title this and that"];
//  List<String> subtext=['Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam ',
//  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueAccent.shade400, Colors.purpleAccent],
              begin: Alignment.bottomLeft,
              end: Alignment.topCenter),
        )),

        Positioned(
          top: 2,
          left: 60,
          child: Image.asset(
            "assets/Image/listimage.png",
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),

        Positioned(
          top: 60,
          left: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "To",
                style: TextStyle(
                  fontSize: 27,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Do",
                style: TextStyle(
                  fontSize: 27,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Me",
                style: TextStyle(fontSize: 27),
              )
            ],

            //),
          ),
        ),
        //SizedBox(height: 150,),
        //Background()),

        SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Opacity(
                    opacity: 0.9,
                    child: Container(
                      padding: const EdgeInsets.only(top: 180),
                      child: Column(children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(top: 20),
                          color: Colors.white70,
                          child:
                              GetBuilder<TodoController>(builder: (controller) {
                            return
                                // child:
                                Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 190, bottom: 15),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              Dialog(child: ManipulateTodo()));
                                    },
                                    child: const Icon(Icons.add),
                                  ),
                                ),
                              ),
                              // ...List.generate(
                              // 10,
                              ...controller.todos
                                  .map((todo) => Padding(
                                        // (index) => Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),

                                        child: Container(
                                            child: Slidable(
                                          // ignore: sort_child_properties_last
                                          child: ListIt(todos: todo),
                                          endActionPane: ActionPane(
                                            motion: ScrollMotion(),
                                            children: [
                                              SlidableAction(
                                                onPressed: (context) {
                                                  controller.titleController
                                                      .text = todo.title!;
                                                  controller
                                                      .descriptionController
                                                      .text = todo.todoNote!;
                                                  controller.update();
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) => Dialog(
                                                          child: ManipulateTodo(
                                                              edit: true,
                                                              todoid: todo
                                                                  .todolistId)));
                                                },
                                                //flex: 2,
                                                backgroundColor: Colors.blue,
                                                foregroundColor: Colors.white,
                                                icon: Icons.edit,
                                                label: 'Edit',
                                              ),
                                              SlidableAction(
                                                onPressed: (context) {
                                                  //controller.titleController
                                                  // .text = todo.title!;
                                                  // controller.descriptionController
                                                  //  .text = todo.description!;
                                                  //controller.update();
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (context) =>
                                                              AlertDialog(
                                                                title: Text(
                                                                    "Delete"),
                                                                content: Text(
                                                                    "Are you sure to delete this todo?"),
                                                                actions: [
                                                                  ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                          primary: Colors
                                                                              .red),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Text(
                                                                          "Cancel")),
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () async {
                                                                      await Get.showOverlay(
                                                                          asyncFunction: () => controller.deleteTodo(todo
                                                                              .todolistId),
                                                                          loadingWidget:
                                                                              const LoadingWidget());
                                                                      // ignore: use_build_context_synchronously
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Text(
                                                                        "Confirm"),
                                                                  )
                                                                ],
                                                              ));
                                                },
                                                backgroundColor: Colors.red,
                                                foregroundColor: Colors.white,
                                                icon: Icons.delete,
                                                label: 'Delete',
                                              ),
                                            ],
                                          ),
                                        )),
                                      ))
                                  .toList()
                            ]);
                          }),
                        )
                      ]),
                    ))))
      ]

          // child:  Background() ),
          ),
    );
  }
}

//  ...List.generate(
//       10,

class ManipulateTodo extends StatelessWidget {
  final bool edit;
  final String? todoid;
  const ManipulateTodo({Key? key, this.edit = false, this.todoid = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<TodoController>(builder: (controller) {
        return Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            // "Add Todo",
            // ignore: unnecessary_brace_in_string_interps

            // ignore: unnecessary_brace_in_string_interps
            "${edit ? "Edit" : "Add"} Todo",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          CustTextField(
            hint: "Title",
            //maxLines: 1,
            controller: controller.titleController,
          ),
          const SizedBox(
            height: 10,
          ),
          CustTextField(
            hint: "Description",
            maxLines: 5,
            controller: controller.descriptionController,
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () async {
              if (!edit) {
                await Get.showOverlay(
                    asyncFunction: () => controller.addTodo(),
                    loadingWidget: const LoadingWidget());
                // ignore: use_build_context_synchronously

              } else {
                await Get.showOverlay(
                    asyncFunction: () => controller.editTodo(todoid),
                    loadingWidget: const LoadingWidget());
              }
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            color: Colors.purple,
            child: Text(
              "${edit ? "Edit" : "Add"} Todo",
              // label: edit?"Edit:"Add",
              // "Add",
              style: TextStyle(color: Colors.white),
            ),
          )
        ]);
      }),
    );
  }
}
