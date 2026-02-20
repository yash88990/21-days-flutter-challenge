import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const calculatorpage(),
    );
  }
}

class calculatorpage extends StatefulWidget {
  const calculatorpage({super.key});

  @override
  State<calculatorpage> createState() => _calculatorpageState();
}

class _calculatorpageState extends State<calculatorpage> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String result = "";

  void add() {
    double num1 = double.parse(num1Controller.text);
    double num2 = double.parse(num2Controller.text);
    setState(() {
      result = (num1 + num2).toStringAsFixed(2);
    });
  }

  void subtract() {
    double num1 = double.parse(num1Controller.text);
    double num2 = double.parse(num2Controller.text);
    setState(() {
      result = (num1 - num2).toStringAsFixed(2);
    });
  }

  void multiply() {
    double num1 = double.parse(num1Controller.text);
    double num2 = double.parse(num2Controller.text);
    setState(() {
      result = (num1 * num2).toStringAsFixed(2);
    });
  }

  void divide() {
    double num1 = double.parse(num1Controller.text);
    double num2 = double.parse(num2Controller.text);
    setState(() {
      result = (num1 / num2).toStringAsFixed(2);
    });
  }

  void pow() {
    double num1 = double.parse(num1Controller.text);
    double num2 = double.parse(num2Controller.text);
    double ans = 1;
    for (int i = 1; i <= num2; i++) {
      ans = num1 * ans;;
    }
    setState(() {
      result = ans.toStringAsFixed(2);
    });
  }

  void clear() {
    setState(() {
      result = "";
      num1Controller.clear();
      num2Controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: num1Controller,
              decoration: InputDecoration(labelText: 'Enter first number'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: num2Controller,
              decoration: InputDecoration(labelText: 'Enter second number'),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: add, child: Text("+")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: subtract, child: Text("-")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: multiply, child: Text("*")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: divide, child: Text("/")),
                SizedBox(width: 10),

                ElevatedButton(onPressed: pow, child: Text("pow")),
                SizedBox(width: 10),
                ElevatedButton(onPressed: clear, child: Text("clear")),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            Text('Result: $result', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
