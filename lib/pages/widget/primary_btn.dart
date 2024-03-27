import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  final VoidCallback onPressed;
  const PrimaryBtn({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          color: const Color(0xff006a71),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'SIGN UP',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
