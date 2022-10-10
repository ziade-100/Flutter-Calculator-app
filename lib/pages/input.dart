// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class UserInput extends StatefulWidget{
   const UserInput({Key? key}): super(key: key);
  UserInputState createState()=> UserInputState();
}

class UserInputState extends State<UserInput> {

   var _textController = TextEditingController();
   var _userPost = "";

    @override 
    Widget build(BuildContext context){
        return Scaffold(
          appBar: AppBar(title: Text("App Bar"),
          actions: [Icon(Icons.menu)],
          ),
          body:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
               Expanded(
                child: Text(_userPost)),
              //Text field 
              TextField(
                 controller:_textController,
                decoration: InputDecoration(
                  hintText: 'What\'s on your mind',
                  border: const OutlineInputBorder(),
                  suffix: IconButton(onPressed:(){
                    _textController.clear();
                  }, icon: const Icon(Icons.clear))
                ),
              ),
              //button 

            MaterialButton(
              color: Colors.blue,
              onPressed: (){
                setState(() {
                  _userPost = _textController.text;
                });
              },
              child: Text("Post", style: TextStyle(fontSize: 15,color: Colors.white),),)
            ],)
        );
    }
}