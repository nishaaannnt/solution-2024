import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const Mybutton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical:15 ),
          decoration: const BoxDecoration(
              color: Color(0xffb8aceb),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}