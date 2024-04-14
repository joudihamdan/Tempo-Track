import 'package:flutter/material.dart';

class customBottom extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const customBottom({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                onPressed: onPressed,
                // style:  const ButtonStyle(
                //   backgroundColor: MaterialStatePropertyAll(
                //     Color.fromARGB(255, 20, 44, 71),
                //   ),
                //   shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18)))),
                //   ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                  child: Text(text,style: TextStyle(fontSize: 20),)),
              );
  }
}