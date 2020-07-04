import 'package:flutter/material.dart';
import 'package:trainngtaskcalcapp/parts/config.dart';


class LogInButton extends StatelessWidget {
final Color colorFirst;
final Color colorSecond;
final String text;
final GestureTapCallback onTap;
LogInButton({this.text,this.colorSecond,this.colorFirst,this.onTap});

  @override
  Widget build(BuildContext context) {
    return     InkWell(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            colorFirst,
            colorSecond,
          ], end: Alignment.topLeft, begin: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            )),
      ),
      onTap: onTap,
    );
  }
}
