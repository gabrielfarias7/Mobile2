import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color _backgroundColor = Colors.white;
  final List<Color> _availableColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _mudarCorDeFundo() {
    final Random random = Random();
    final int index = random.nextInt(_availableColors.length);
    setState(() {
      _backgroundColor = _availableColors[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              if (_counter >= 10)
                Text(
                  'Máximo de pessoas excedido!',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: Text('+'),
                  ),
                  SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: _decrementCounter,
                    tooltip: 'Decrement',
                    child: Text('-'),
                  ),
                  FloatingActionButton(
                    onPressed: _mudarCorDeFundo,
                    tooltip: 'Change Background Color',
                    child: Text('C'),
                  )
                ],
              ),
            ],
          ),
        ),
        backgroundColor: _backgroundColor);
  }
}
