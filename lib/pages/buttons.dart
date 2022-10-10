import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  @override 
  final color;
  final textColor;
  final String? buttonText;
  final buttonTapped;
  
 MyButton({this.color, this.textColor,this.buttonText, this.buttonTapped});

Widget build(BuildContext context){
    return GestureDetector(
      onTap: buttonTapped,
      
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          color: color,
          child: Center(child:Text(buttonText!,style: TextStyle(color:textColor,fontSize: 20),)),
          
    )),
    );
}

}