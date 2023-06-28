import 'package:bloc/bloc.dart';

//TODO: Add bloc event pattern here
class ModpackBloc extends Bloc<String, String> {
  ModpackBloc() : super('');

  @override
  Stream<String> mapEventToState(String event) async* {
    yield event;
  }
}
