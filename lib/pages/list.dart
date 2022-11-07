import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/todo.dart';
import 'todo.dart';

class ListIt extends StatelessWidget {
  final Todo todos;
  const ListIt({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var todo;
    return Card(
        elevation: 10,
        child: ListTile(
            //   todo: todo,
            // ignore: prefer_const_constructorsr`
            title: Text(
              todos.title!,
//"Title this and that",
              style: const TextStyle(
                  //  GoogleFonts.oswald(
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            leading: Text(
              todos.createdDate!,
              // "Title this and that",
              // "08/12/22",
              style: const TextStyle(
                //  GoogleFonts.oswald(
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              todos.todoNote!,
              //'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam ',
              style: const TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                color: Color(0xff000000),
              ),
            )));
  }
}
