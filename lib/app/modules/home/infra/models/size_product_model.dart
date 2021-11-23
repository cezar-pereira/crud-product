import 'package:crud_products/app/modules/home/domain/entities/size_product_entity.dart';

class SizeProductModel extends SizeProductEntity {
  SizeProductModel(
      {required bool available, required String size, required String sku})
      : super(available: available, size: size, sku: sku);

  Map<String, dynamic> toMap() =>
      {'available': available, 'size': size, 'sku': sku};

  factory SizeProductModel.fromMap({required Map<String, dynamic> map}) {
    return SizeProductModel(
        available: map['available'], size: map['size'], sku: map['sku']);
  }
}
