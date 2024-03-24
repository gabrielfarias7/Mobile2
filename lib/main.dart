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
      title: 'Contador de Cliques',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.orange,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Contador de Cliques'),
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
    Colors.teal,
    Colors.pink,
    Colors.indigo,
    Colors.amber,
    Colors.deepOrange,
    Colors.deepPurple,
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

  void _changeBackgroundColor() {
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
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Número de cliques:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            if (_counter >= 10)
              Text(
                'Limite máximo de cliques atingido!',
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
                  tooltip: 'Incrementar',
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Decrementar',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: _changeBackgroundColor,
                  tooltip: 'Alterar Cor de Fundo',
                  child: Icon(Icons.color_lens),
                )
              ],
            ),
          ],
        ),
      ),
      backgroundColor: _backgroundColor,
    );
  }
}
