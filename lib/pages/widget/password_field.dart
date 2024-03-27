import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 74, vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 17),
      decoration: BoxDecoration(
        color: Color(0xfff4f9f9),
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Password',
          hintStyle: TextStyle(
            color: Color(0xffb4b4b8),
          ),
        ),
      ),
    );
  }
}
