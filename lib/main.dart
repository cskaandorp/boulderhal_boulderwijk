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
      title: 'Boulderhal Boulderwijk',
      theme: ThemeData(useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: SizedBox(
            width: 500,
            height: 300,
            child: Column(
              children: [
                Text('Boulderwijk', style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold)),
                Text('Coming Soon...', style: TextStyle(fontSize: 20.0)),
              ],
            ),
          )
        )
      ));
  }
}
