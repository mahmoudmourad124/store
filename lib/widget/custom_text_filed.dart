import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFiled extends StatelessWidget {
  CustomTextFiled(
      {required this.hintText,
      this.keyboardType,
      required this.onChanged,
      this.inputFormatters});
  String? hintText;
  TextInputType? keyboardType;
  Function(String)? onChanged;
  List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        // obscureText: true,
        decoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            hintText: hintText,
            contentPadding: const EdgeInsets.only(left: 10),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ))),
        onChanged: onChanged);
  }
}
