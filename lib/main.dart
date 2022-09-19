import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Offset _offset = Offset(0.4, 0.7);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(0.01 * _offset.dy)
          ..rotateY(-0.01 * _offset.dx),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onPanUpdate: (details) => setState(() => _offset += details.delta),
          onDoubleTap: () => setState(() => _offset = Offset.zero),
          child: _defaultApp(context),
        ));
  }

  _defaultApp(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              style: Theme.of(context).textTheme.headline4,
            ),
            Transform.rotate(
              angle: -45 * (pi / 180.0),
              child: ElevatedButton(
                child: const Text("Rotated button"),
                onPressed: () {},
              ),
            ),
            Transform(
              transform: Matrix4.rotationZ(-45 * (pi / 180.0)),
              alignment: Alignment.center,
              child: ElevatedButton(
                child: const Text("Rotated button"),
                onPressed: () {},
              ),
            ),
            Transform.scale(
              scale: 2.0,
              child: ElevatedButton(
                child: const Text("scaled up"),
                onPressed: () {},
              ),
            ),
            Transform(
              transform: Matrix4.identity()..scale(2.0, 2.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                child: const Text("scaled up (matrix)"),
                onPressed: () {},
              ),
            ),
            Transform.translate(
              offset: const Offset(100, 300),
              child: ElevatedButton(
                child: const Text("translated to bottom"),
                onPressed: () {},
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(100, 300, 0),
              child: ElevatedButton(
                child: const Text("translated to bottom (matrix)"),
                onPressed: () {},
              ),
            ),
            Transform.translate(
              offset: const Offset(70, 200),
              child: Transform.rotate(
                angle: -45 * (pi / 180.0),
                child: Transform.scale(
                  scale: 2.0,
                  child: ElevatedButton(
                    child: const Text("multiple transformations"),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.translationValues(70, 200, 0)
                ..rotateZ(-45 * (pi / 180.0))
                ..scale(2.0, 2.0),
              child: ElevatedButton(
                child: const Text("multiple transformations (matrix)"),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
