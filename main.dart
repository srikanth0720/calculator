import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calciii',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _operand = "";
  double _num1 = 0.0;
  double _num2 = 0.0;

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _operand = "";
        _num1 = 0.0;
        _num2 = 0.0;
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
        _num1 = double.parse(_output);
        _operand = buttonText;
        _output = "";
      } else if (buttonText == "=") {
        _num2 = double.parse(_output);
        double result = 0.0;
        switch (_operand) {
          case "+":
            result = _num1 + _num2;
            break;
          case "-":
            result = _num1 - _num2;
            break;
          case "*":
            result = _num1 * _num2;
            break;
          case "/":
            if (_num2 != 0)
               result = _num1 / _num2;
            else
              _output = "Error";
            break;
        }
        _output = result.toString();
        _operand = "";
        _num1 = 0.0;
        _num2 = 0.0;
      } else {
        if (_output == "0") {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText, {Color color = Colors.blueAccent}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.all(22),
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 30),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calsiii')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/", color: Colors.red),
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*", color: Colors.red),
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-", color: Colors.red),
                ],
              ),
              Row(
                children: [
                  buildButton("C", color: Colors.green),
                  buildButton("0"),
                  buildButton("=", color: Colors.green),
                  buildButton("+", color: Colors.red),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}