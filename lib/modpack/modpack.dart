import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'bloc/loader_bloc.dart';
import 'bloc/modpack_bloc.dart';

class ModpackPage extends StatelessWidget {
  final TextEditingController modPackNameController = TextEditingController();
  final TextEditingController minecraftVersionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final modpackBloc = BlocProvider.of<ModpackBloc>(context);
    final loaderBloc = BlocProvider.of<LoaderBloc>(context);

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
                  modpackBloc.add(value);
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
                  modpackBloc.add(value);
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Select mod loader:',
              ),
              const SizedBox(height: 10.0),
              BlocBuilder<LoaderBloc, String>(
                builder: (context, state) {
                  return Column(
                    children: [
                      RadioListTile<String>(
                        title: const Text('Forge'),
                        value: 'Forge',
                        groupValue: state,
                        onChanged: (value) {
                          loaderBloc.add(value);
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Fabric'),
                        value: 'Fabric',
                        groupValue: state,
                        onChanged: (value) {
                          loaderBloc.add(value);
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Vanilla'),
                        value: 'Vanilla',
                        groupValue: state,
                        onChanged: (value) {
                          loaderBloc.add(value);
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
