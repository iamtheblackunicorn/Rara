import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new Rara(),
      debugShowCheckedModeBanner: false
    )
  );
}

class Rara extends StatefulWidget {
  RaraState createState() {
    return RaraState();
  }
}
class RaraState extends State<Rara> {
  late Random randInst;
  late String randNum;
  late String statusText;
  late String userGuess;
  @override
  void initState() {
    super.initState();
    randInst = new Random();
    randNum = randInst.nextInt(1000).toString();
    statusText = 'No I/O!';
    userGuess = 0.toString();
  }
  @override
  void evaluateGuess(String text){
    int userGuess = int.parse(text);
    int randNumber = int.parse(randNum);
    if (userGuess == randNumber){
      setState((){
        statusText = 'You guessed it!';
      });
      resetGuess();
    }
    else {
      if (userGuess > randNumber) {
        setState((){
          statusText = 'Are ya a plane?';
        });
      }
      else {
        setState((){
          statusText = 'You a mole?';
        });
      }
    }
  }
  @override
  void resetGuess() {
    setState((){
      randInst = new Random();
      randNum = randInst.nextInt(1000).toString();
      statusText = 'RESET!';
    });
  }
  @override
  Widget build(BuildContext context){
    TextEditingController inputController =
      new TextEditingController();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget> [
              new SizedBox(
                height: 50,
              ),
              new Padding(
                padding: EdgeInsets.all(20),
                child: new Text(
                  '$statusText',
                  style: new TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                  )
                )
              ),
              new Padding(
                padding: EdgeInsets.all(20),
                child: new Text(
                  '$userGuess',
                  style: new TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                  )
                )
              ),
              new Padding(
                padding: EdgeInsets.all(60),
                child: new TextField(
                  cursorColor: Color(0xFFFFFFFF),
                  cursorWidth: 6.0,
                  controller: inputController,
                  decoration: new InputDecoration(
                    counterText: '',
                    hintText: 'Your Guess',
                    hintStyle: TextStyle(
                      fontSize: 30,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFFFFFFF),
                        width: 6.0
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFFFFFFF),
                        width: 6.0,
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFFFFFFF),
                        width: 6.0
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  )
                )
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  new Padding(padding:EdgeInsets.all(50),child:new RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    onPressed: () {
                      evaluateGuess(inputController.text);
                      setState((){
                        userGuess = inputController.text;
                      });
                    },
                    color: Color(0xFFFFFFFF),
                    child: new Padding(
                      padding: EdgeInsets.all(20),
                      child: new Text(
                        'SUBMIT',
                        style: new TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 35,
                          fontWeight: FontWeight.bold
                        )
                      )
                    )
                  )),
                  new Padding(padding:EdgeInsets.all(50),child:new RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    onPressed: () {
                      resetGuess();
                    },
                    color: Color(0xFFFFFFFF),
                    child: new Padding(
                      padding: EdgeInsets.all(20),
                      child: new Text(
                        'RESET',
                        style: new TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 35,
                          fontWeight: FontWeight.bold
                        )
                      )
                    )
                  ))
                ]
              )
            ]
          )
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: <Color> [
              Color(0xFFFA8E00),
              Color(0xFFFAF600)
            ]
          )
        )
      )
    );
  }
}
