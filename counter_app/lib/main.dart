import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;
  void badhao(){
    setState(() {
      count++;
    });
  }
  void ghatado(){
    setState(() {
      count--;
    });
  }
  void reset(){
    setState(() {
      count=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('counter_app'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'count:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 240, 139, 105),
              ),
            ),
            SizedBox(height: 5),
            Text(
              '$count',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: ghatado, child: Text("-")),
                SizedBox(width: 20),
                ElevatedButton(onPressed: reset, child: Text("Reset")),
                SizedBox(width: 20),
                ElevatedButton(onPressed: badhao, child: Text("+")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
