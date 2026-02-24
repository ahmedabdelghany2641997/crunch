import 'package:flutter/material.dart';

Widget CustomButton({
  required String text,
  required void Function()? onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pinkAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 25)),
      ),
    ),
  );
}
