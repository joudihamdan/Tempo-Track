import 'package:flutter/material.dart';

class CostumContainer extends StatelessWidget {
   final Widget widget;
  const CostumContainer({super.key,required this.widget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        // decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topLeft,
        //         end: Alignment.bottomCenter,
        //         colors: [
        //       Color.fromARGB(66, 147, 223, 241),
        //       Color.fromARGB(255, 78, 163, 202),
        //       Color.fromARGB(255, 51, 115, 145)
        //     ])),
            child: widget,
      )
    );
  }
}