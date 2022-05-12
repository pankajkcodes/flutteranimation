import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // All Animation Variables
  late Animation<double> fadeAnimation;
  late AnimationController fadeAnimationController;

  @override
  void initState() {
    super.initState();
    fadeAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    fadeAnimation =
        Tween(begin: 0.0, end: 1.0).animate(fadeAnimationController.view);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: fadeAnimation,
                  child: Container(
                    height: 400,
                    width: 400,
                    color: Colors.green,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      fadeAnimationController.forward();
                    },
                    child: const Text("Show")),
                ElevatedButton(
                    onPressed: () {
                      fadeAnimationController.reverse();
                    },
                    child: const Text("Hide")),
              ],
            ),
          ),
        ));
  }
}
