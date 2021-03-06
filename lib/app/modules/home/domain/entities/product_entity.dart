import 'package:crud_products/app/modules/home/domain/entities/size_product_entity.dart';

class ProductEntity {
  final String id;
  final String name;
  final String style;
  final String codeColor;
  final String colorSlug;
  final String color;
  final bool onSale;
  final double regularPrice;
  final double actualPrice;
  final double discountPercentage;
  final String installments;
  final String image;
  final List<SizeProductEntity> sizes;
  ProductEntity({
    this.id = '',
    required this.name,
    this.style = '',
    this.codeColor = '',
    this.colorSlug = '',
    this.color = '',
    this.onSale = true,
    required this.regularPrice,
    double? actualPrice,
    double? discountPercentage,
    this.installments = '',
    this.image = '',
    this.sizes = const [],
  })  : actualPrice = actualPrice ?? regularPrice,
        discountPercentage = discountPercentage ?? 0;

  double get discountPercentageCalc =>
      ((actualPrice * 100) / regularPrice) - 100;

  @override
  String toString() => '$name $colorSlug $color';
}
