import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

@immutable
class Person {
  final String name;
  final int age;

  const Person({
    required this.name,
    required this.age,
  });

  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        age = json['int'];
}

Future<Iterable<Person>> getPersons(String url) => HttpClient()
    .getUrl(Uri.parse(url))
    .then((request) => request.close())
    .then((respons) => respons.transform(utf8.decoder).join())
    .then((string) => json.decode(string) as List<dynamic>)
    .then((list) => list.map((e) => Person.fromJson(e)));
