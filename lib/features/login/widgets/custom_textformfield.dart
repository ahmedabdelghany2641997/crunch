import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final Widget? prefixIcon;
  final Widget lab;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function()? onTap;




  const CustomTextFormField({
    super.key,
    required this.text,
    this.prefixIcon,
    required this.lab,
    this.validator,
    this.controller,
    this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        label: lab,
        prefixIcon: prefixIcon,
        focusColor: Colors.pinkAccent,
        hintText: text,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.zero,
        ),
      ),
    );
  }
}