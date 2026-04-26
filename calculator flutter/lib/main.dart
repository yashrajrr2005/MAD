import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Calc()));

class Calc extends StatefulWidget {
  const Calc({super.key});
  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  String input = "", result = "";

  void press(String val) {
    setState(() {
      if (val == "C") {
        input = "";
        result = "";
      } else if (val == "=") {
        try {
          result = eval(input);
        } catch (e) {
          result = "Error";
        }
      } else {
        input += val;
      }
    });
  }

  String eval(String exp) {
    exp = exp.replaceAll('×', '*').replaceAll('÷', '/');
    final parts = RegExp(r'(\d+\.?\d*)([+\-*/])(\d+\.?\d*)').firstMatch(exp);
    if (parts == null) return "";
    double a = double.parse(parts.group(1)!);
    double b = double.parse(parts.group(3)!);
    switch (parts.group(2)) {
      case '+': return "${a + b}";
      case '-': return "${a - b}";
      case '*': return "${a * b}";
      case '/': return b != 0 ? "${a / b}" : "Error";
      default: return "";
    }
  }

  Widget btn(String t) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: ElevatedButton(
            onPressed: () => press(t),
            child: Text(t, style: const TextStyle(fontSize: 20)),
          ),
        ),
      );

  @override
  Widget build(BuildContext c) => Scaffold(
        appBar: AppBar(title: const Text("Calculator")),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(input, style: const TextStyle(fontSize: 24)),
                  Text(result, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(children: [btn("7"), btn("8"), btn("9"), btn("÷")]),
                  Row(children: [btn("4"), btn("5"), btn("6"), btn("×")]),
                  Row(children: [btn("1"), btn("2"), btn("3"), btn("-")]),
                  Row(children: [btn("0"), btn("C"), btn("="), btn("+")]),
                ],
              ),
            )
          ],
        ),
      );
}