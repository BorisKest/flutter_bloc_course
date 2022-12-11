import 'package:bloc_course/src/view/home_screen.dart';

extension UrlString on PersonUrl {
  String get urlString {
    switch (this) {
      case PersonUrl.persons1:
        return 'http://192.168.74.83:5500/api/persons1.json';
      case PersonUrl.persons2:
        return 'http://192.168.74.83:5500/api/persons2.json';
    }
  }
}
