/*
RaRa by Alexander Abraham, "The Black Unicorn".
Licensed under the MIT license.
*/

/// Importing this for to
/// use the [Random] class.
import 'dart:math';
/// Importing this for to
/// use all of Flutter's components.
import 'package:flutter/material.dart';

/// This section contains all
/// the variables for this app.
/// Slight modifications can be
/// made here.
double lineWidth = 6.0;
String defaultFont = 'LSD';
Color fontColor = Color(0xFFFFFFFF);
Color buttonFontColor = Color(0xFF000000);
Color gradientOne = Color(0xFFFA8E00);
Color gradientTwo = Color(0xFFFAF600);
String resetButtonText = 'RESET';
String submitButtonText = 'SUBMIT';
String guessPlaceHolder = 'YOUR GUESS';
String guessedItText = 'YOU GUESSED IT!';
String tooHighText = 'TOO HIGH!';
String tooLowText = 'TOO LOW!';
String noInputText = 'NO I/O!';
double stdPadding = 10;
double numOne = 30;
double numTwo = 30;
double numThree = 20;
double numFour = 25;
double specNum = 200;
int randCeiling = 1000;

/// Main entry point for
/// the Dart VM.
void main() {
  runApp(
    new MaterialApp(
      home: new Rara(),
      debugShowCheckedModeBanner: false,
    )
  );
}

/// This class implements the stateful
/// components of the app's main class.
class Rara extends StatefulWidget {
  RaraState createState() {
    return RaraState();
  }
}
/// This class actually returns the
/// widget tree.
class RaraState extends State<Rara> {
  late Random randInst;
  late String randNum;
  late String statusText;
  late String userGuess;
  @override
  void initState() {
    super.initState();
    randInst = new Random();
    randNum = randInst.nextInt(randCeiling).toString();
    statusText = noInputText;
    userGuess = 0.toString();
  }
  @override
  void evaluateGuess(String text){
    int userGuess = int.parse(text);
    int randNumber = int.parse(randNum);
    if (userGuess == randNumber){
      setState((){
        statusText = guessedItText;
      });
      resetGuess();
    }
    else {
      if (userGuess > randNumber) {
        setState((){
          statusText = tooHighText;
        });
      }
      else {
        setState((){
          statusText = tooLowText;
        });
      }
    }
  }
  @override
  void resetGuess() {
    setState((){
      randInst = new Random();
      int increment = 1;
      randCeiling = randCeiling * (increment++);
      randNum = randInst.nextInt(randCeiling).toString();
      statusText = resetButtonText;
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
                height: specNum,
              ),
              new Padding(
                padding: EdgeInsets.all(stdPadding),
                child: new Text(
                  statusText,
                  style: new TextStyle(
                    color: fontColor,
                    fontSize: numFour,
                    fontWeight: FontWeight.bold,
                    fontFamily: defaultFont
                  )
                )
              ),
              new Padding(
                padding: EdgeInsets.all(stdPadding),
                child: new Text(
                  userGuess,
                  style: new TextStyle(
                    color: fontColor,
                    fontSize: numFour,
                    fontWeight: FontWeight.bold,
                    fontFamily: defaultFont
                  )
                )
              ),
              new Padding(
                padding: EdgeInsets.all(numTwo),
                child: new TextField(
                  cursorColor: fontColor,
                  cursorWidth: lineWidth,
                  controller: inputController,
                  decoration: new InputDecoration(
                    counterText: '',
                    hintText: guessPlaceHolder,
                    hintStyle: TextStyle(
                      fontSize: numTwo,
                      color: fontColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: defaultFont
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: fontColor,
                        width: lineWidth
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: fontColor,
                        width: lineWidth
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: fontColor,
                        width: lineWidth
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: fontColor,
                    fontSize: numTwo,
                    fontWeight: FontWeight.bold,
                    fontFamily: defaultFont
                  )
                )
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  new Padding(
                    padding:EdgeInsets.all(numOne),
                    child: new RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(numTwo)
                      ),
                      onPressed: () {
                        evaluateGuess(inputController.text);
                        setState((){
                          userGuess = inputController.text;
                        });
                      },
                      color: fontColor,
                      child: new Padding(
                        padding: EdgeInsets.all(stdPadding),
                        child: new Text(
                          submitButtonText,
                          style: new TextStyle(
                            color: buttonFontColor,
                            fontSize: numFour,
                            fontWeight: FontWeight.bold,
                            fontFamily: defaultFont
                          )
                        )
                      )
                    )
                  ),
                  new Padding(
                    padding:EdgeInsets.all(numOne),
                    child:new RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(numTwo)
                      ),
                      onPressed: () {
                        resetGuess();
                      },
                      color: fontColor,
                      child: new Padding(
                        padding: EdgeInsets.all(stdPadding),
                        child: new Text(
                          resetButtonText,
                          style: new TextStyle(
                            color: buttonFontColor,
                            fontSize: numFour,
                            fontWeight: FontWeight.bold,
                            fontFamily: defaultFont
                          )
                        )
                      )
                    )
                  )
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
              gradientOne,
              gradientTwo
            ]
          )
        )
      )
    );
  }
}
