import 'package:calculator/pages/buttons.dart';
//import 'package:calculator/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
   @override 
   Widget build(BuildContext context){
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
      );
   }
}

class HomePage extends StatefulWidget{
  @override 
  identifying createState()=> identifying();
}

class identifying extends State<HomePage>{
   var userQuestion = "";
   var userAnswer = "";
   
   final List<String> buttons = [
      'C','Del','%','/',
      '9','8','7','x',
      '6','5','4','-',
      '3','2','1','+',
      '0','.','Ans','=',
   ];

    @override
    Widget build(BuildContext context){
       return Scaffold(
           backgroundColor: Colors.deepPurple[200],
           body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50,),
                      Container(
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.centerLeft,
                        child: Text(userQuestion,style: TextStyle(fontSize: 20),),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        child: Text(userAnswer,style: TextStyle(fontSize: 20)),
                      )
                    ]),
                )),

                Expanded(
                flex: 2,
                child: Container(
                    padding: EdgeInsets.all(15),
                    child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
                    itemBuilder: (BuildContext context, int index){
                        if(index ==0){
                            return MyButton(
                            buttonTapped: (){
                               setState(() {
                                  userQuestion = "";
                               });
                            },
                            buttonText: buttons[index],
                            color:Colors.green,
                            textColor: Colors.black,
                        );
                        }else if(index==1){
                            return MyButton(
                             buttonTapped: (){
                               setState(() {
                                  userQuestion = userQuestion.substring(0,userQuestion.length-1);
                               });
                            },
                            buttonText: buttons[index],
                            color:Colors.red[800],
                            textColor: Colors.black,
                        );
                        }else if(index== buttons.length-1){
                            return MyButton(
                             buttonTapped: (){
                               setState(() {
                                  equalPressed;
                               });
                            },
                            buttonText: buttons[index],
                            color:Colors.deepPurple,
                            textColor: Colors.black,
                        );
                        }else{
                          return MyButton(
                           buttonTapped: (){
                               setState(() {
                                  userQuestion += buttons[index];
                               });
                            },
                            buttonText: buttons[index],
                            color:isOperator(buttons[index])? Colors.deepPurple: Colors.deepPurple[50],
                            textColor: Colors.black,
                        );
                        }
                    }))
                ),]
            
           )
       );
    
    }
    //identifying operators 
    bool isOperator(String x){
         if(x== "%" || x == "x"|| x=="+" || x=="%" || x=="." || x=="-" || x=="=" || x=="/" || x=="Ans"){
           return true;
         }else{
          return false;
         }
      }

  void equalPressed(){
  String finalQuestion = userQuestion;
  Parser p = Parser();
  Expression exp = p.parse(finalQuestion);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  userAnswer = eval.toString();
  
  }
}