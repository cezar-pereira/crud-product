// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_product_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SizeProductModelHiveAdapter extends TypeAdapter<SizeProductModelHive> {
  @override
  final int typeId = 1;

  @override
  SizeProductModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SizeProductModelHive(
      available: fields[0] as bool,
      size: fields[1] as String,
      sku: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SizeProductModelHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.available)
      ..writeByte(1)
      ..write(obj.size)
      ..writeByte(2)
      ..write(obj.sku);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SizeProductModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
