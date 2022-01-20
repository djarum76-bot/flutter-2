import 'package:desainui/customwidget/calculator_button.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int a = 0;
  int b = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                      "0",
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.white),
                  ),
                ),
              )
          ),
          GridView.count(
              padding: EdgeInsets.all(0),
              crossAxisCount: 4,
              shrinkWrap: true,
              children: [
                CalculatorButton(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    text: "C",
                    onTap: (){
                      setState(() {
                        a = 0;
                        b = 0;
                      });
                    },
                ),
                CalculatorButton(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    text: "+/-",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    text: "%",
                    onTap: (){},
                ),
                CalculatorButton.Icon(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    foregroundColor: Theme.of(context).primaryColorLight,
                    text: "Backspace",
                    icon: Icons.backspace,
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    text: "7",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    text: "8",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    text: "9",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    foregroundColor: Theme.of(context).primaryColorLight,
                    text: "/",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    text: "4",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    text: "5",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    text: "6",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    foregroundColor: Theme.of(context).primaryColorLight,
                    text: "X",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    text: "1",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    text: "2",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    text: "3",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    foregroundColor: Theme.of(context).primaryColorLight,
                    text: "-",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    text: "0",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    text: ".",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).primaryColorDark,
                    text: "=",
                    onTap: (){},
                ),
                CalculatorButton(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    foregroundColor: Theme.of(context).primaryColorLight,
                    text: "+",
                    onTap: (){},
                ),
              ],
          )
        ],
      ),
    );
  }
}