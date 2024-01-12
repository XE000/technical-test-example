// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tray.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrayAdapter extends TypeAdapter<Tray> {
  @override
  final int typeId = 4;

  @override
  Tray read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tray(
      fruits: (fields[0] as List).cast<Fruit>(),
    );
  }

  @override
  void write(BinaryWriter writer, Tray obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.fruits);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
