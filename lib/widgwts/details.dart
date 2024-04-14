import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String text;
  final String value;
  const Details({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 209, 151, 236),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
      ],
    );
  }
}
