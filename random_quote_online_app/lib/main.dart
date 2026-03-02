import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'quote app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: randomquotepage(),
    );
  }
}

class randomquotepage extends StatefulWidget {
  const randomquotepage({super.key});

  @override
  State<randomquotepage> createState() => _randomquotepageState();
}

class _randomquotepageState extends State<randomquotepage> {
  String quote = "loading...";
  String author = " ";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchquote();
  }

  Future<void> fetchquote() async {
  final Uri url =
      Uri.parse("https://quoteslate.vercel.app/api/quotes/random");

  try {
    final http.Response response = await http.get(url);

    print("STATUS CODE: ${response.statusCode}");
    print("BODY: ${response.body}");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        quote = data['quote'];
        author = data['author'];
      });
    } else {
      setState(() {
        quote = 'failed to load quote';
        author = 'invalid';
      });
    }
  } catch (e) {
    print("ERROR: $e");
    setState(() {
      quote = "error when fetching data";
      author = "";
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Quote Generator App"),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 30),
        backgroundColor: const Color.fromARGB(255, 218, 34, 200),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$quote",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            Text(
              "$author",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: fetchquote, child: Text("click me ")),
          ],
        ),
      ),
    );
  }
}
