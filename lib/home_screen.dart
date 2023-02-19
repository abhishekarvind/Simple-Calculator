import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){

    if(buttonText == "AC"){

      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){

      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";

    } else if(buttonText == "."){

      if(_output.contains(".")){
        print("Already conatains a decimals");
        return;

      } else {
        _output = _output + buttonText;
      }

    } else if (buttonText == "="){

      num2 = double.parse(output);

      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "X"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else {

      _output = _output + buttonText;

    }

    print(_output);

    setState(() {

      output = double.parse(_output).toStringAsFixed(2);

    });

  }


  Widget button(double h,double w,col,String text,col1){
    return GestureDetector(
      onTap: (){
        buttonPressed(text);
      },
      child: Container(
        decoration: BoxDecoration(
            color: col,
            borderRadius: BorderRadius.circular(50)
        ),
        height: h,
        width: w,
        child: Center(
            child: Text(text,style: TextStyle(
                color: col1,
                fontSize: 40
            ),)
        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(output,style: TextStyle(
                  fontSize: 80,color: Colors.white
                ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button(90, 90, Colors.grey, 'AC',Colors.black),
                        button(90, 90, Colors.amber, '-',Colors.black),
                        button(90, 90, Colors.amber, '+',Colors.black),
                        button(90, 90, Colors.amber, '=',Colors.black),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button(90, 90, Colors.grey, '1',Colors.black),
                        button(90, 90, Colors.grey, '2',Colors.black),
                        button(90, 90, Colors.grey, '3',Colors.black),
                        button(90, 90, Colors.amber, '4',Colors.black),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button(90, 90, Colors.grey, '5',Colors.black),
                        button(90, 90, Colors.grey, '6',Colors.black),
                        button(90, 90, Colors.grey, '7',Colors.black),
                        button(90, 90, Colors.amber, '8',Colors.black),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button(90, 90, Colors.grey, '.',Colors.black),
                        button(90, 90, Colors.grey, '9',Colors.black),
                        button(90, 90, Colors.grey, '0',Colors.black),
                        button(90, 90, Colors.amber, '00',Colors.black),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

