import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modpack_manager/modpack/bloc/modpack_bloc_event.dart';
import 'package:modpack_manager/modpack/bloc/modpack_bloc_state.dart';

//TODO: Add bloc event pattern here
class ModpackBloc extends Bloc<ModPackBlocEvent, ModPackBlocState> {
  ModpackBloc(super.initialState) {
    void onModPackUpdate(
        OnModPackUpdate event, Emitter<ModPackBlocState> emit) {
          
        }
    void _onFileProcess(OnSyncProcess event, Emitter<ModPackBlocState> emit) {}
    on<OnSyncProcess>(_onFileProcess);
    on<OnModPackUpdate>(onModPackUpdate);
  }
}
