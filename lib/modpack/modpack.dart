import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modpack_manager/modpack/bloc/modpack_bloc_state.dart';
import 'package:modpack_manager/modpack/models/enums.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'bloc/modpack_bloc.dart';

class ModpackPage extends StatelessWidget {
  final TextEditingController modPackNameController = TextEditingController();
  final TextEditingController minecraftVersionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    //TODO: Solve the equatable problem here. Its doenst update the state :(
    final modpackBloc = BlocProvider.of<ModpackBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Minecraft Modpack Server Manager'),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Mod pack name:',
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: modPackNameController,
                onChanged: (value) {
                  modpackBloc.state.name = value;
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Minecraft version name:',
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: minecraftVersionController,
                onChanged: (value) {
                  modpackBloc.state.gameVersion = value;
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Select mod loader:',
              ),
              const SizedBox(height: 10.0),
              BlocBuilder<ModpackBloc, ModPackBlocState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      RadioListTile<ModLoaderType>(
                        title: const Text('Forge'),
                        value: ModLoaderType.forge,
                        groupValue: state.modLoaderType,
                        onChanged: (value) {
                          modpackBloc.state.copyWith(modLoaderType: value);
                        },
                      ),
                      RadioListTile<ModLoaderType>(
                        title: const Text('Fabric'),
                        value: ModLoaderType.fabric,
                        groupValue: state.modLoaderType,
                        onChanged: (value) {
                          modpackBloc.state.copyWith(modLoaderType: value);
                        },
                      ),
                      RadioListTile<ModLoaderType>(
                        title: const Text('Vanilla'),
                        value: ModLoaderType.vanilla,
                        groupValue: state.modLoaderType,
                        onChanged: (value) {
                          modpackBloc.state.copyWith(modLoaderType: value);
                        },
                      ),
                    ],
                  );
                },
              ),
              TextButton(
                onPressed: () async {
                  final modpackName = modPackNameController.text;
                  final directory = await getApplicationDocumentsDirectory();
                  final serverFilesDir =
                      Directory('${directory.path}/$modpackName/client_files');
                  if (!serverFilesDir.existsSync()) {
                    serverFilesDir.createSync(recursive: true);
                  }
                  if (await serverFilesDir.exists()) {
                    await Process.run('open', [serverFilesDir.path]);
                  }
                },
                child: Text(
                  'Client files',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              TextButton(
                onPressed: () async {
                  final modpackName = modPackNameController.text;
                  final directory = await getApplicationDocumentsDirectory();
                  final serverFilesDir =
                      Directory('${directory.path}/$modpackName/server_files');
                  if (!serverFilesDir.existsSync()) {
                    serverFilesDir.createSync(recursive: true);
                  }
                  if (await serverFilesDir.exists()) {
                    await Process.run('open', [serverFilesDir.path]);
                  }
                },
                child: Text(
                  'Server files',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () async {
                    final modpackName = modPackNameController.text;
                    final minecraftVersion = minecraftVersionController.text;
                    final directory = await getApplicationDocumentsDirectory();
                    final serverFilesDir =
                        Directory('${directory.path}/$modpackName');

                    print('Mod pack name: $modpackName');
                    print('Minecraft version name: $minecraftVersion');
                    print('Selected directory: $serverFilesDir');
                  },
                  child: Text(
                    'Create',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ])));
  }
}
