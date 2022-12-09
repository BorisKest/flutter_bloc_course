import 'package:bloc_course/src/view/home_screen.dart';
import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      title: 'Flutter bloc',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    ),
  );
}
