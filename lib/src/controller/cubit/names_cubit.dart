import 'package:bloc/bloc.dart';
import 'package:bloc_course/src/models/names_model.dart';
import 'package:meta/meta.dart';

part 'names_state.dart';

class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);

  void pickRandomName() => emit(names.getRandomElement());
}
