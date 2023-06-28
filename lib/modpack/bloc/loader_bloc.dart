import 'package:flutter_bloc/flutter_bloc.dart';

//TODO: Add bloc event pattern here
class LoaderBloc extends Bloc<String?, String> {
  LoaderBloc() : super('');

  @override
  Stream<String> mapEventToState(String? event) async* {
    yield event ?? '';
  }
}
