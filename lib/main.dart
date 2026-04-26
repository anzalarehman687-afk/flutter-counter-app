import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  void saveCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', counter);
  }

  void increaseCounter() {
    setState(() {
      counter++;
    });
    saveCounter();
  }

  void decreaseCounter() {
    setState(() {
      counter--;
    });
    saveCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter Value:",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "$counter",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: increaseCounter,
                  child: Text("+"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: decreaseCounter,
                  child: Text("-"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}