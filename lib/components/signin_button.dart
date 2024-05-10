import 'package:flutter/material.dart';

class MySignInButton extends StatelessWidget {
  const MySignInButton({super.key, this.onTap, required this.text});
final Function()? onTap;
final String text;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration:BoxDecoration(
          color: Colors.grey.shade600,
          borderRadius: BorderRadius.circular(8)
        ) ,
        child: Center(
          child: Text(text,style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
