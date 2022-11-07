import 'package:flutter/material.dart';

class CustTextField extends StatelessWidget {
  final String? hint;
  final bool obsecureText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int? maxLines;

  const CustTextField(
      {Key? key,
      this.hint,
      this.obsecureText = false,
      required this.controller,
      this.keyboardType,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
        controller: controller,
        maxLines: maxLines,
        obscureText: obsecureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          //hintstyle
        ),
      ),
    );
  }
}
