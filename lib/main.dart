import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:miya_ani/screens/ani_shelf/view.dart';

@Preview(name: 'My Sample Text')
Widget mySampleText() {
  return const Text('Hello, World!');
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const Scaffold(body: Center(child: Text('Hello, World!'))),
    );
  }
}
