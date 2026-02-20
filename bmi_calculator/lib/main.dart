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
      title: 'BMI Calculator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const bmi(),
    );
  }
}

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String result = "";
  String category = "";
  void calculatebmi() {
    double height = double.parse(heightController.text) / 100;
    double weight = double.parse(weightController.text);
    double bmi = weight / (height * height);
    setState(() {
      result = bmi.toStringAsFixed(2);
      if (bmi < 18.5)
        category = "underweight";
      else if (bmi < 24.9)
        category = "normal";
      else if (bmi < 29.9)
        category = "overweight";
      else
        category = "obese";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator App"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: heightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Height in cm",
            ),

          ),
          SizedBox(height: 10),
          TextField(
            controller: weightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Weight in kg",
            ),

          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: calculatebmi,
            child: Text("Calculate BMI"),
          ),
          SizedBox(height: 10),
          Text("BMI: $result"),
          SizedBox(height: 10,),
          Text("$category")
        ],
      )
    );
  }
}
