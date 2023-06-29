import 'package:equatable/equatable.dart';
import 'package:modpack_manager/modpack/models/minecraft_file_model.dart';

class ModPackBlocEvent extends Equatable {
  const ModPackBlocEvent();

  @override
  List<Object> get props => [];
}

class OnModPackUpdate extends ModPackBlocEvent {
  @override
  List<Object> get props => [];
}

// event to compute one local file
// The last server camp Boberto, the cron suddenly stopped the backups at  machine level. Soo.. we lost us world and i abandoned everything related with Boberto after that.
// Now we needs to create a Miro board to easily undestand this process more.

//The goal to not upload every client file
// 1. Call API to create a process of sync with the name of modpack and author and especify that is client_files
// 2. Api return a UUID to identify the process
// 3. If the modpacks not exists at remote, create a new modpack and goes to next step
// 4. The client send a list of client_files MinecraftFileModel.
// 5. The api return a list of MinecraftFileModel that needs be uploaded to client_files.
// 6. Create a manifest.json at client folder with last sync date, list of all current files and separe all files by array blocks type( library, version, mods )..

//The goal to not upload every server file
// 1. Call API to create a process of sync with the name of modpack and author and especify that is a server_files
// 2. Api return a UUID to identify the process
// 3. If the modpacks not exists at remote, verify if the user that create the api key configures a server without client sync
// 4. The client send a list of server_files MinecraftFileModel.
// 5. The API inform all current players at server that the server will be restarted with new update after 5 minutes and some slowless reactions can happen
// 6. Lock all server files and create a backup folder, compress to zip.
// 7. Now this is the moment that gourutines will really apprecied. We need to notify these changes to a RCON connection with the server affected.
// 8. Create a manifest.json file at server folder with last sync date, and list of all current files.

class OnSyncProcess extends ModPackBlocEvent {
  final List<MinecraftFileModel> minecraftFileModel;

  const OnSyncProcess(this.minecraftFileModel);

  @override
  List<Object> get props => [minecraftFileModel];
}

class OnUpload extends ModPackBlocEvent {}
