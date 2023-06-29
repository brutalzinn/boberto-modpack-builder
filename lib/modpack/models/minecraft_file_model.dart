// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:modpack_manager/modpack/models/enums.dart';

class MinecraftFileModel {
  final String name;
  final String md5;
  final MinecraftFileType minecraftFileType;
  MinecraftFileModel({
    required this.name,
    required this.md5,
    required this.minecraftFileType,
  });

  MinecraftFileModel copyWith({
    String? name,
    String? md5,
    MinecraftFileType? minecraftFileType,
  }) {
    return MinecraftFileModel(
      name: name ?? this.name,
      md5: md5 ?? this.md5,
      minecraftFileType: minecraftFileType ?? this.minecraftFileType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'md5': md5,
      'fileType': minecraftFileType.name
    };
  }

  factory MinecraftFileModel.fromMap(Map<String, dynamic> map) {
    return MinecraftFileModel(
        name: map['name'] as String,
        md5: map['md5'] as String,
        minecraftFileType: map['minecraftFileType'] != null
            ? MinecraftFileType.values.byName(map['minecraftFileType'])
            : MinecraftFileType.other);
  }

  String toJson() => json.encode(toMap());

  factory MinecraftFileModel.fromJson(String source) =>
      MinecraftFileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MinecraftFileModel(name: $name, md5: $md5, fileType: $minecraftFileType)';

  @override
  bool operator ==(covariant MinecraftFileModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.md5 == md5 &&
        other.minecraftFileType == minecraftFileType;
  }

  @override
  int get hashCode => name.hashCode ^ md5.hashCode ^ minecraftFileType.hashCode;
}
