import 'package:calculator_app/components/my_button.dart';
import 'package:calculator_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(userInput.toString(), style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(answer.toString(), style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(title: 'AC',onPress: (){
                          userInput = '';
                          answer = '';
                          setState(() {

                          });
                          print('Tap');
                        },),
                        MyButton(title: '+/-',onPress: (){
                          userInput += '+/-';
                          setState(() {
                          });
                          print('Tap');
                        },),
                        MyButton(title: '%',onPress: (){
                          userInput += '%';
                          setState(() {
                          });
                          print('Tap');
                        },),
                        MyButton(title: '/',onPress: (){
                          userInput += '/';
                          setState(() {
                          });
                          print('Tap');
                        }, color: Color(0xffffA00A),),

                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '7',onPress: (){
                          userInput += '7';
                          setState(() {
                          });
                          print('Tap');
                        },),
                        MyButton(title: '8',onPress: (){
                          userInput += '8';
                          setState(() {

                          });
                          print('Tap');
                        },),
                        MyButton(title: '0',onPress: (){
                          userInput += '0';
                          setState(() {
                          });
                          print('Tap');
                        },),
                        MyButton(title: 'X',onPress: (){
                          userInput += 'X';
                          setState(() {
                          });
                          print('Tap');
                        }, color: Color(0xffffA00A),),

                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '4',onPress: (){
                          userInput += '4';
                          setState(() {
                          });
                          print('Tap');
                        },),
                        MyButton(title: '5',onPress: (){
                          userInput += '5';
                          setState(() {
                          });
                          print('Tap');
                        },),
                        MyButton(title: '6',onPress: (){
                          userInput += '6';
                          setState(() {
                          });
                          print('Tap');
                        },),
                        MyButton(title: '-',onPress: (){
                          userInput += '-';
                          setState(() {
                          });
                          print('Tap');
                        }, color: Color(0xffffA00A),),

                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '1',onPress: (){
                          userInput += '1';
                          setState(() {
                          });
                          print('Tap');
                        },),
                        MyButton(title: '2',onPress: (){
                          userInput += '2';
                          setState(() {
                          });
                          print('Tap');
                        },),
                        MyButton(title: '3',onPress: (){
                          userInput += '3';
                          setState(() {
                          });
                          print('Tap');
                        },),
                        MyButton(title: '+',onPress: (){
                          userInput += '+';
                          setState(() {
                          });
                          print('Tap');
                        }, color: Color(0xffffA00A),),

                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '0',onPress: (){
                          userInput += '0';
                          setState(() {
                          });
                          print('Tap');
                        },),
                        MyButton(title: '.',onPress: (){
                          userInput += '.';
                          setState(() {
                          });
                          print('Tap');
                        },),
                        MyButton(title: 'DEL',onPress: (){
                          userInput = userInput.substring(0,userInput.length-1);
                          setState(() {
                          });
                          print('Tap');
                        },),
                        MyButton(title: '=',onPress: (){
                          equalPress();
                          setState(() {
                          });
                          print('Tap');
                        }, color: Color(0xffffA00A),),

                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    try {
      String finalInput = userInput;

      finalInput = finalInput.replaceAll('X', '*');

      Parser p = Parser();
      Expression expression = p.parse(finalInput);
      ContextModel contextModel = ContextModel();

      double eval = expression.evaluate(EvaluationType.REAL, contextModel);
      answer = eval.toString();
    } catch (e) {
      answer = 'Error';
    }
  }

}

