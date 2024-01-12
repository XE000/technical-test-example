// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fruit_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FruitDataAdapter extends TypeAdapter<FruitData> {
  @override
  final int typeId = 1;

  @override
  FruitData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FruitData(
      trays: (fields[0] as List).cast<Tray>(),
      baskets: (fields[1] as List).cast<Basket>(),
    );
  }

  @override
  void write(BinaryWriter writer, FruitData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.trays)
      ..writeByte(1)
      ..write(obj.baskets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FruitDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
