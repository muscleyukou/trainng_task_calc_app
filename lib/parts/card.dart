import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardInput extends StatelessWidget {
  CardInput({this.onTap,this.textFirst,this.textSecond,this.icon});
final  String textFirst;
final  String textSecond;
final  IconData icon;
  GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white30,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: InkWell(
          hoverColor: Colors.blue,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Icon(icon)),
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(textFirst,style: TextStyle(fontSize: 20),),
                            Text(textSecond,style: TextStyle(fontSize: 20),),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            onTap:onTap,
        ),
      ),
    );
  }
}
