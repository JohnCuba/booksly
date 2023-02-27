// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opds_library.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OpdsLibraryAdapter extends TypeAdapter<OpdsLibrary> {
  @override
  final int typeId = 2;

  @override
  OpdsLibrary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OpdsLibrary(
      uri: fields[0] == null ? '' : fields[0] as String,
      title: fields[1] == null ? '' : fields[1] as String,
      slug: fields[3] == null ? '' : fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OpdsLibrary obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uri)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.slug);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OpdsLibraryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
