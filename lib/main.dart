import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'Caculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  btnPressed(String btnText) {

    if(btnText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (btnText == "/" || btnText == "X" || btnText == "-" || btnText == "+") {
      num1 = double.parse(output);
      operand = btnText;
      _output = "0";
    } else if (btnText == ".") {
      if(!_output.contains(".")) {
        _output = _output + btnText;
      }
    } else if (btnText == "=") {
      num2 = double.parse(output);

      if(operand == "+") {
        _output = (num1 + num2).toString();
      } if(operand == "-") {
        _output = (num1 - num2).toString();
      } if(operand == "/") {
        _output = (num1 / num2).toString();
      } if(operand == "X") {
        _output = (num1 * num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else {
      _output = _output + btnText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
    
  }

  Widget buildButton(String btnText){
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24.0),
        child: Text(btnText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () => btnPressed(btnText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 12.0
                ),
                child: Text(output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold
                ),)
              ),
              Expanded(
                child: Divider(),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("/"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("X"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("-"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("."),
                      buildButton("0"),
                      buildButton("00"),
                      buildButton("+"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("CLEAR"),
                      buildButton("="),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
