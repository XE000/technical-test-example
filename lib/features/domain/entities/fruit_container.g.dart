// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fruit_container.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FruitContainerAdapter extends TypeAdapter<FruitContainer> {
  @override
  final int typeId = 2;

  @override
  FruitContainer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FruitContainer(
      fruits: (fields[0] as List).cast<Fruit>(),
    );
  }

  @override
  void write(BinaryWriter writer, FruitContainer obj) {
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
      other is FruitContainerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
