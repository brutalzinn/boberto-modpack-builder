import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modpack_manager/modpack/bloc/modpack_bloc_state.dart';
import 'package:modpack_manager/modpack/modpack.dart';
import 'modpack/bloc/modpack_bloc.dart';

void main() {
  runApp(HomePage());
}

/*
[BLOG.ROBERTOCPAES.DEV - HYPERFOCUS - PERSONAL DATA COMMENTARY - IGNORE]
  At this moment we dont have energy to dev anything.
  This is because we are at a conjucture failure at routine manager and Wakatime stopped to notify me.
  This means that without wakatime, i suddenly immerse at my hyperfocus project and lost my selfcare.
  BLOG.ROBERTOCPAES.DEV - HYPERFOCUS - PERSONAL DATA COMMENTARY - IGNORE]
*/

class HomePage extends StatelessWidget {
  final _initialModPackState = ModPackBlocState.createDefault();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Minecraft modpack server manager',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightGreen[800],
          secondaryHeaderColor: Colors.green,
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontSize: 72, fontWeight: FontWeight.bold, color: Colors.green),
            titleLarge: TextStyle(
                fontSize: 36, fontStyle: FontStyle.italic, color: Colors.green),
            bodyMedium: TextStyle(
                fontSize: 14, fontFamily: 'Hind', color: Colors.green),
          ),
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<ModpackBloc>(
              create: (context) => ModpackBloc(_initialModPackState),
            ),
          ],
          child: ModpackPage(),
        ));
  }
}
