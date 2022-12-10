import 'package:bloc_course/src/controller/extensions/url_string.dart';
import 'package:bloc_course/src/models/person_mode.dart';
import 'package:bloc_course/src/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoadPersonsAction extends LoadAction {
  final PersonUrl url;

  const LoadPersonsAction({required this.url}) : super();
}

@immutable
class FetchResult {
  final Iterable<Person> persons;
  final bool isRetrivedFromCache;
  const FetchResult({
    required this.persons,
    required this.isRetrivedFromCache,
  });
  @override
  String toString() =>
      'FetchResult (isRetrivedFromCache = $isRetrivedFromCache, persons = $persons';
}

class PersonsBloc extends Bloc<LoadAction, FetchResult?> {
  final Map<PersonUrl, Iterable<Person>> _cache = {};
  PersonsBloc() : super(null) {
    on<LoadPersonsAction>(
      (event, emit) async {
        final url = event.url;
        if (_cache.containsKey(url)) {
          final cachedPersons = _cache[url];
          final result =
              FetchResult(persons: cachedPersons!, isRetrivedFromCache: true);
          emit(result);
        } else {
          final persons = await getPersons(url.urlString);
          _cache[url] = persons;
          final result =
              FetchResult(persons: persons, isRetrivedFromCache: false);
        }
      },
    );
  }
}
