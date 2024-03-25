import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'main-page.dart';

const String appTitle = 'Akatsuki';
const Color losiColor = Color.fromARGB(255, 255, 36, 0);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: losiColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const Center(
          child: PostCardList(),
        ),
        bottomNavigationBar: const BottomAppBar(
        ),
      ),
    );
  }
}
