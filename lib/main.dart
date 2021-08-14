/// RaRa by Alexander Abraham, "The Black Unicorn".
/// Licensed under the MIT license.
/// A radnom number is generated
/// and you have to guess it.

/// Importing this for to
/// use the [Random] class.
import 'dart:math';

/// Importing this to
/// use all of Flutter's components.
import 'package:flutter/material.dart';

/// This section contains all
/// the variables for this app.
/// Slight modifications can be
/// made here.

/// Textfield line thicknesses.
double lineWidth = 6.0;

/// Custom font name.
String defaultFont = 'LSD';

/// App colors.
Color fontColor = Color(0xFFFFFFFF);
Color buttonFontColor = Color(0xFF000000);
Color gradientOne = Color(0xFFFA8E00);
Color gradientTwo = Color(0xFFFAF600);
Color gradientThree = Color(0xFF7A88DE);
Color gradientFour = Color(0xFFD291BC);

/// Messages to the user.
String resetButtonText = 'RESET';
String submitButtonText = 'SUBMIT';
String guessPlaceHolder = 'YOUR GUESS';
String guessedItText = 'YOU GUESSED IT!';
String tooHighText = 'TOO HIGH!';
String tooLowText = 'TOO LOW!';
String noInputText = 'NO I/O!';

/// Layout variables.
double stdPadding = 10;
double numOne = 30;
double numTwo = 30;
double numThree = 20;
double numFour = 25;
double specNum = 75;
int randCeiling = 1000;
double stdRounding = 40;
double specialPadding = 40;

/// Main entry point for
/// the Dart VM.
void main() {
  runApp(
    new MaterialApp(

      /// Main "screen".
      home: new Rara(),

      /// Disables the "debug" banner in
      /// the top-right.
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
/// widget tree of the main "app".
class RaraState extends State<Rara> {

  /// Initialising an
  /// instance of the [Random] class.
  /// This will be updated. Instances
  /// only carry across one "state"
  /// of the app.
  late Random randInst;

  /// Initialising an
  /// instance of the random
  /// number to be guessed.
  late String randNum;

  /// Initialising an
  /// the status text.
  late String statusText;

  /// Initialising the
  /// user's guess.
  late String userGuess;

  /// Setting initial values for
  /// the variables from right above
  /// as the initial state.
  @override
  void initState() {
    super.initState();
    randInst = new Random();
    randNum = randInst.nextInt(randCeiling).toString();
    statusText = noInputText;
    userGuess = 0.toString();
  }

  /// Processing the user's guess.
  @override
  void evaluateGuess(String text){

    /// Converting the user's guess
    /// to an integer.
    int userGuess = int.parse(text);

    /// Converting the random number
    /// to an integer.
    int randNumber = int.parse(randNum);

    /// Checking if the guess is equal
    /// to the random number.
    if (userGuess == randNumber){
      setState((){

        /// Updating the status text
        /// to say the game is over
        /// and you won.
        statusText = guessedItText;
      });

      /// Resetting the [Random]
      /// instance and generating
      /// a new random number.
      resetGuess();
    }
    else {
      if (userGuess > randNumber) {
        setState((){

          /// Updating the status text
          /// to say the user's guess is
          /// too high.
          statusText = tooHighText;
        });
      }
      else {
        setState((){

          /// Updating the status text
          /// to say the user's guess is
          /// too low.
          statusText = tooLowText;
        });
      }
    }
  }

  /// Resetting the [Random]
  /// instance and generating
  /// a new random number.
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

    /// Controller for the [TextField]
    /// to get the user's guess.
    TextEditingController inputController =
      new TextEditingController();

    /// Returning a Material widget
    /// from the [build] method.
    return Scaffold(
      backgroundColor: Colors.transparent,

      /// Parent widget is scrollable
      /// for a more flexible layout.
      body: new SingleChildScrollView(
        child:new Container(
          child: new Center(
            child: new Column(
              children: <Widget> [

                /// A small amount of
                /// an empty box to pad
                /// the top of the layout.
                new SizedBox(
                  height: specNum,
                ),

                /// This is the main widget.
                new Padding(
                  padding: EdgeInsets.all(specialPadding),

                  /// This is the main container.
                  child:new Container(
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                        colors: <Color> [
                        gradientThree,
                        gradientFour
                      ]
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(stdRounding)
                    )
                  ),

                  /// Aligning all widgets in the center
                  /// of the parent and in a column.
                  child:new Center(
                    child: new Column(
                      children: <Widget> [

                        /// The text widget for
                        /// the status text to
                        /// reflect how accurate the
                        /// user's guess was.
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

                        /// The text widget for
                        /// the status text to
                        /// reflect the
                        /// user's guess.
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

                        /// Textfield to get the user's guess.
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

                        /// Aligning the action buttons
                        /// in a row next to each other.
                        new Row(

                          /// Controls whether the child widgets are
                          /// spread equally across the available space.
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget> [

                            /// Padded [SUBMIT] button widget.
                            /// Evaluates the user's guess.
                            new Padding(
                              padding:EdgeInsets.all(numOne),
                              child: new RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(numTwo)
                                ),
                                onPressed: () {

                                  /// Passing the user's guess
                                  /// to the [evaluateGuess] function.
                                  evaluateGuess(inputController.text);
                                  setState((){

                                    /// Updating the text to
                                    /// reflect the user's input.
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

                            /// Resets the whole game.
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
                  )
                )
              ),

              /// A small amount of
              /// an empty box to pad
              /// the bottom of layout.
              new SizedBox(
                height: specNum,
              ),
            ]
          ),
        ),

        /// Ensures the main container is the size
        /// of the entire screen.
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(

          /// Gives the parent container
          /// (after the [Scaffold])
          /// the fade-in and fade-out
          /// colors.
          gradient: new LinearGradient(
            colors: <Color> [
              gradientOne,
              gradientTwo
            ]
          )
        )
      )
    )
  );
}}
