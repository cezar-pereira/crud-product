// ignore_for_file: annotate_overrides, overridden_fields
import 'package:crud_products/app/modules/home/infra/models/size_product_model.dart';
import 'package:hive/hive.dart';

part 'size_product_model_hive.g.dart';

@HiveType(typeId: 1)
class SizeProductModelHive extends SizeProductModel {
  @HiveField(0)
  bool available;
  @HiveField(1)
  String size;
  @HiveField(2)
  String sku;

  SizeProductModelHive(
      {required this.available, required this.size, required this.sku})
      : super(available: available, size: size, sku: sku);

  factory SizeProductModelHive.fromMap({required Map<String, dynamic> map}) {
    return SizeProductModelHive(
        available: map['available'], size: map['size'], sku: map['sku']);
  }

  SizeProductModelHive copyWith({bool? available}) {
    return SizeProductModelHive(
        available: available ?? this.available, size: size, sku: sku);
  }
}
