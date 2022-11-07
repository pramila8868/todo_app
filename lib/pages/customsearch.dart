import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final Function(String) onChanged;
  const Search({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
// ignore: prefer_const_constructors
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 12,
            )
          ]),

      child: TextFormField(
        onChanged: (String val) {
          onChanged(val);
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "search",
          //hintstyle
        ),
      ),
    );
  }
}
