import 'package:bloc_course/src/controller/bloc/bloc.dart';
import 'package:bloc_course/src/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() {
  runApp(
    MaterialApp(
      title: 'Flutter bloc',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home:  BlocProvider(
        create: (_) => PersonsBloc(),
        child: const HomeScreen(),
      ),
    ),
  );
}
