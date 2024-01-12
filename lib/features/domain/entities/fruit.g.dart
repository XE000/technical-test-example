// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fruit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FruitAdapter extends TypeAdapter<Fruit> {
  @override
  final int typeId = 6;

  @override
  Fruit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fruit(
      fruitType: fields[0] as FruitType,
      quantity: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Fruit obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fruitType)
      ..writeByte(1)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FruitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FruitTypeAdapter extends TypeAdapter<FruitType> {
  @override
  final int typeId = 5;

  @override
  FruitType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FruitType.apple;
      case 1:
        return FruitType.banana;
      case 2:
        return FruitType.orange;
      default:
        return FruitType.apple;
    }
  }

  @override
  void write(BinaryWriter writer, FruitType obj) {
    switch (obj) {
      case FruitType.apple:
        writer.writeByte(0);
        break;
      case FruitType.banana:
        writer.writeByte(1);
        break;
      case FruitType.orange:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FruitTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
