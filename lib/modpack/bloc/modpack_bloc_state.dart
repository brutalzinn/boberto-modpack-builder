// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:modpack_manager/modpack/models/enums.dart';
import 'package:modpack_manager/modpack/models/minecraft_file_model.dart';

class ModPackBlocState extends Equatable {
  String name;
  String ip;
  String gameVersion;
  String loaderVersion;
  ModLoaderType modLoaderType;
  List<MinecraftFileModel>? clientFiles;
  List<MinecraftFileModel>? serverFiles;
  ModPackBlocState({
    required this.name,
    required this.ip,
    required this.gameVersion,
    required this.loaderVersion,
    required this.modLoaderType,
    this.clientFiles,
    this.serverFiles,
  });

  ModPackBlocState.createDefault({
    this.name = "default",
    this.ip = "127.0.0.1",
    this.gameVersion = "1.12.2",
    this.loaderVersion = "",
    this.modLoaderType = ModLoaderType.vanilla,
  });

  ModPackBlocState copyWith({
    String? name,
    String? ip,
    String? gameVersion,
    String? loaderVersion,
    ModLoaderType? modLoaderType,
    List<MinecraftFileModel>? clientFiles,
    List<MinecraftFileModel>? serverFiles,
  }) {
    return ModPackBlocState(
      name: name ?? this.name,
      ip: ip ?? this.ip,
      gameVersion: gameVersion ?? this.gameVersion,
      loaderVersion: loaderVersion ?? this.loaderVersion,
      modLoaderType: modLoaderType ?? this.modLoaderType,
      clientFiles: clientFiles ?? this.clientFiles,
      serverFiles: serverFiles ?? this.serverFiles,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'ip': ip,
      'gameVersion': gameVersion,
      'loaderVersion': loaderVersion,
      'modLoaderType': modLoaderType.name,
      'clientFiles': clientFiles != null ? clientFiles!.toList() : null
    };
  }

  factory ModPackBlocState.fromMap(Map<String, dynamic> map) {
    return ModPackBlocState(
      name: map['name'] as String,
      ip: map['ip'] as String,
      gameVersion: map['gameVersion'] as String,
      loaderVersion: map['loaderVersion'] as String,
      modLoaderType: map['modLoaderType'] != null
          ? ModLoaderType.values.byName(map['modLoaderType'])
          : ModLoaderType.vanilla,
      clientFiles: map['clientFiles'] != null
          ? List<MinecraftFileModel>.from(
              (map['clientFiles'] as List<MinecraftFileModel>)
                  .map<MinecraftFileModel?>(
                (x) => MinecraftFileModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      serverFiles: map['serverFiles'] != null
          ? List<MinecraftFileModel>.from(
              (map['serverFiles'] as List<MinecraftFileModel>)
                  .map<MinecraftFileModel?>(
                (x) => MinecraftFileModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModPackBlocState.fromJson(String source) =>
      ModPackBlocState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModPackBlocState(name: $name, ip: $ip, gameVersion: $gameVersion, loaderVersion: $loaderVersion, modLoaderType: $modLoaderType, clientFiles: $clientFiles, serverFiles: $serverFiles)';
  }

  @override
  bool operator ==(covariant ModPackBlocState other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.ip == ip &&
        other.gameVersion == gameVersion &&
        other.loaderVersion == loaderVersion &&
        other.modLoaderType == modLoaderType &&
        listEquals(other.clientFiles, clientFiles) &&
        listEquals(other.serverFiles, serverFiles);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        ip.hashCode ^
        gameVersion.hashCode ^
        loaderVersion.hashCode ^
        modLoaderType.hashCode ^
        clientFiles.hashCode ^
        serverFiles.hashCode;
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      name,
      ip,
      gameVersion,
      loaderVersion,
      modLoaderType,
      clientFiles!,
      serverFiles!,
    ];
  }
}
