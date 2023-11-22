import 'package:flutter/material.dart';

Padding buildButton(Function() onTap, String text) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 25.0),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150.0,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  );
}

Padding buildTextField(IconData icon, final controller, String hintText,
    bool obscureText, TextInputType type) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextField(
      keyboardType: type,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey[500]),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              )),
          fillColor: Colors.grey[200],
          filled: true),
    ),
  );
}
