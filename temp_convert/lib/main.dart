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
      title: 'Temperature Convertor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: tempconvertor(),
    );
  }
}

class tempconvertor extends StatefulWidget {
  const tempconvertor({super.key});

  @override
  State<tempconvertor> createState() => _tempconvertorState();
}
 
class _tempconvertorState extends State<tempconvertor> {
  TextEditingController temp_controller = TextEditingController();
  String selectedtype = "C to F";
  String result = "";

  void calculate_temp() {
    double temp = double.parse(temp_controller.text); 
    double converted_temp;
    if (selectedtype == "C to F") {
      converted_temp = (temp * 9 / 5) + 32;
    } else {
      converted_temp = (temp - 32) * 5 / 9;
    }
    setState(() {
      result = converted_temp.toStringAsFixed(2);
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature Convertor App"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: temp_controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hint: Text("enter temperature"),
            ),
          ),
          SizedBox(height: 20),
          DropdownButton<String>(
            value: selectedtype,
            isExpanded: true,
            items: const [
              DropdownMenuItem(
                value: "C to F",
                child: Text("Celsius to Fahrenheit"),
              ),
              DropdownMenuItem(
                value: "F to C",
                child: Text("Fahrenheit to Celsius"),
              ),
              
            ],
            onChanged: (value) {
              setState(() {
                selectedtype = value!;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: calculate_temp, child: Text("Calculate")),
          SizedBox(height: 20),
          Text(
            "The converted temperature is: $result",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
