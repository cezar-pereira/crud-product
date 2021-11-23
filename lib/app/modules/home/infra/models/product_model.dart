import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:crud_products/app/modules/home/domain/entities/size_product_entity.dart';
import 'package:crud_products/app/modules/home/infra/models/size_product_model.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {id = '',
      required name,
      required String style,
      required String codeColor,
      required String colorSlug,
      required String color,
      required bool onSale,
      required regularPrice,
      required double actualPrice,
      required double discountPercentage,
      required String installments,
      required String image,
      required List<SizeProductEntity> sizes})
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

  factory ProductModel.fromMap({required Map<String, dynamic> map}) {
    double parsePrice({required String value}) {
      String result = value.trim().replaceAll(RegExp(r'[R\s$]'), '');
      result = result.replaceAll(',', '.');
      return double.parse(result);
    }

    double parseDiscount({required String value}) {
      return value.isEmpty ? 0 : double.parse(value.trim().replaceAll('%', ''));
    }

    return ProductModel(
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
        sizes: List<SizeProductModel>.from(
            map['sizes'].map((size) => SizeProductModel.fromMap(map: size))));
  }
}
