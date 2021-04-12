import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController numberController = TextEditingController();

  int randomNumber = 0;

  @override
  void initState() {
    generateRandomNumber();
    super.initState();
  }
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Welcome',
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w500),
        ),
      ),
      // backgroundColor: Colors.lightBlue,
      body: Column(
        children: [
          SizedBox(
            height: 15,
            width: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Guess the number between 1-100',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              style: new TextStyle(fontSize: 22.0, color: Colors.black),
              decoration: new InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter a number',
              ),
            ),
          ),
          SizedBox(
            height: 25,
            width: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  checkNumber(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shadowColor: Colors.deepOrangeAccent,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(100.0),
                  ),
                ),
                child: Text(
                  'Enter',
                )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: generateRandomNumber,
      ),
    );
  }

  void generateRandomNumber() {
    Random random = new Random();
    randomNumber = random.nextInt(100);
    print(randomNumber);
  }

  void checkNumber(BuildContext ctx) {
    if (numberController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Enter a number",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print('Hello');
      return;
    }
    int userNumber = int.parse(numberController.text);
    if (randomNumber == userNumber) {
      showAlertDialog(ctx);
    } else {
      // ignore: unnecessary_statements
      (showAlertDialogs(ctx));
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Status"),
      content: Text("You Won"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogs(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Status"),
      content: Text("Better luck next time . Thank You"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
