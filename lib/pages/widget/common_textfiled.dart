import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
  const CommonTextfield({
    Key? key,
    required TextEditingController controller,
    required this.hintText,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 74, vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
        color: const Color(0xfff4f9f9),
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xffb4b4b8),
          ),
        ),
      ),
    );
  }
}
