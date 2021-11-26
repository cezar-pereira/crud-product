// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelHiveAdapter extends TypeAdapter<ProductModelHive> {
  @override
  final int typeId = 0;

  @override
  ProductModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModelHive(
      id: fields[0] as String,
      name: fields[1] as String,
      style: fields[2] as String,
      codeColor: fields[3] as String,
      colorSlug: fields[4] as String,
      color: fields[5] as String,
      onSale: fields[6] as bool,
      regularPrice: fields[7] as double,
      actualPrice: fields[8] as double?,
      discountPercentage: fields[9] as double?,
      installments: fields[10] as String,
      image: fields[11] as String,
      sizes: (fields[12] as List).cast<SizeProductModelHive>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductModelHive obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.style)
      ..writeByte(3)
      ..write(obj.codeColor)
      ..writeByte(4)
      ..write(obj.colorSlug)
      ..writeByte(5)
      ..write(obj.color)
      ..writeByte(6)
      ..write(obj.onSale)
      ..writeByte(7)
      ..write(obj.regularPrice)
      ..writeByte(8)
      ..write(obj.actualPrice)
      ..writeByte(9)
      ..write(obj.discountPercentage)
      ..writeByte(10)
      ..write(obj.installments)
      ..writeByte(11)
      ..write(obj.image)
      ..writeByte(12)
      ..write(obj.sizes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
