import 'package:flutter/material.dart';

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

  void increaseCounter() {
    setState(() {
      counter++;
    });
  }

  void decreaseCounter() {
    setState(() {
      counter--;
    });
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
            )
          ],
        ),
      ),
    );
  }
}