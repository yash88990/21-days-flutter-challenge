import 'dart:math';

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
      title: 'Quote Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: quotepage(),
    );
  }
}

class quotepage extends StatefulWidget {
  const quotepage({super.key});

  @override
  State<quotepage> createState() => _quotepageState();
}

class _quotepageState extends State<quotepage> {
  String quote = "Click button to generate new Quote";
  String author = "unknown";

  final List<Map<String, String>> quotes = [
    {"quote": "Success is built on the courage to start, even when the path is unclear.", "author": "Yash Verma"},
{"quote": "Consistency beats motivation when dreams feel far away.", "author": "Ananya Rao"},
{"quote": "Small progress every day leads to big achievements tomorrow.", "author": "Arjun Mehta"},
{"quote": "Discipline is choosing what you want most over what you want now.", "author": "Kavya Sharma"},
{"quote": "Your only competition is who you were yesterday.", "author": "Rohan Kapoor"},
{"quote": "Dream big, start small, act now.", "author": "Neha Singh"},
{"quote": "Hard work turns ordinary efforts into extraordinary results.", "author": "Aman Gupta"},
{"quote": "Focus on growth, not on approval.", "author": "Ishita Malhotra"},
{"quote": "Push yourself, because no one else is going to do it for you.", "author": "Aarav Joshi"},
{"quote": "Great things never come from comfort zones.", "author": "Meera Nair"},
{"quote": "Stay patient and trust your journey.", "author": "Ritika Verma"},
{"quote": "Your mindset determines your success.", "author": "Kabir Malhotra"},
{"quote": "Turn your setbacks into comebacks.", "author": "Simran Kaur"},
{"quote": "Dreams work when you do.", "author": "Aditya Sharma"},
{"quote": "Believe in yourself a little more each day.", "author": "Priya Desai"},
{"quote": "Effort today creates opportunity tomorrow.", "author": "Rahul Bansal"},
{"quote": "Be stronger than your excuses.", "author": "Sneha Kapoor"},
{"quote": "The best investment is in your own growth.", "author": "Vikram Sethi"}
  ];

  void getrandomquote() {
    final random = Random();
    final index = random.nextInt(quotes.length);
    setState(() {
      quote = quotes[index]['quote']!;
      author = quotes[index]['author']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Quote Generator App'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 72, 121, 101),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$quote",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25),
            ),
            SizedBox(height: 20),
            Text(
              "$author",
              style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: getrandomquote, child: Text('Generate')),
          ],
        ),
      ),
    );
  }
}
