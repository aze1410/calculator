import 'package:calculator/comp/MyButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '.',
    '0',
    '00',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(99, 12, 36, 51),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userQuestion,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userAnswer,
                    style: GoogleFonts.poppins(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Center(
                  child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = "";
                              userAnswer = "";
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blueAccent.shade200.withOpacity(0.3)
                              : Colors.white60.withOpacity(0.1),
                          textcolor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.black54,
                        );
                      } else if (index == 1) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blueAccent.shade200.withOpacity(0.3)
                              : Colors.white60.withOpacity(0.1),
                          textcolor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.black54,
                        );
                      } else if (index == buttons.length - 1) {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blueAccent.shade200.withOpacity(0.1)
                              : Colors.white60.withOpacity(0.1),
                          textcolor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.black54,
                        );
                      } else {
                        return MyButton(
                          buttonTapped: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blueAccent.shade200.withOpacity(0.1)
                              : Colors.white.withOpacity(0.1),
                          textcolor: Colors.white,
                        );
                      }
                      ;
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  bool isOperator(String x) {
    if (x == '%' ||
        x == '/' ||
        x == 'DEL' ||
        x == 'C' ||
        x == 'x' ||
        x == '-' ||
        x == '+' ||
        x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
