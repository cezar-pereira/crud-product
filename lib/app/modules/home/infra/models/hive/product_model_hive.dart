// ignore_for_file: annotate_overrides, overridden_fields
import 'package:crud_products/app/modules/home/infra/models/product_model.dart';
import 'package:hive/hive.dart';

import 'size_product_model_hive.dart';
part 'product_model_hive.g.dart';

@HiveType(typeId: 0)
class ProductModelHive extends ProductModel with HiveObjectMixin {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String style;
  @HiveField(3)
  String codeColor;
  @HiveField(4)
  String colorSlug;
  @HiveField(5)
  String color;
  @HiveField(6)
  bool onSale;
  @HiveField(7)
  double regularPrice;
  @HiveField(8)
  double actualPrice;
  @HiveField(9)
  double discountPercentage;
  @HiveField(10)
  String installments;
  @HiveField(11)
  String image;
  @HiveField(12)
  List<SizeProductModelHive> sizes;

  ProductModelHive(
      {this.id = '',
      required this.name,
      required this.style,
      required this.codeColor,
      required this.colorSlug,
      required this.color,
      required this.onSale,
      required this.regularPrice,
      required this.actualPrice,
      required this.discountPercentage,
      required this.installments,
      required this.image,
      required this.sizes})
      : super(
          id: id,
          name: name,
          style: style,
          codeColor: codeColor,
          colorSlug: colorSlug,
          color: color,
          onSale: onSale,
          regularPrice: regularPrice,
          actualPrice: actualPrice,
          discountPercentage: discountPercentage,
          installments: installments,
          image: image,
          sizes: sizes,
        );

  factory ProductModelHive.fromMap({required Map<String, dynamic> map}) {
    double parsePrice({required String value}) {
      String result = value.trim().replaceAll(RegExp(r'[R\s$]'), '');
      result = result.replaceAll(',', '.');
      return double.parse(result);
    }

    double parseDiscount({required String value}) {
      return value.isEmpty ? 0 : double.parse(value.trim().replaceAll('%', ''));
    }

    return ProductModelHive(
        id: map['id'],
        name: map['name'],
        style: map['style'],
        codeColor: map['code_color'],
        colorSlug: map['color_slug'],
        color: map['color'],
        onSale: map['on_sale'],
        regularPrice: parsePrice(value: map['regular_price']),
        actualPrice: parsePrice(value: map['actual_price']),
        discountPercentage: parseDiscount(value: map['discount_percentage']),
        installments: map['installments'],
        image: map['image'],
        sizes: List<SizeProductModelHive>.from(map['sizes']
            .map((size) => SizeProductModelHive.fromMap(map: size))));
  }
}
