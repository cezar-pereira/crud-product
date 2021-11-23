import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final ProductEntity product;

  setUpAll(() {
    product = ProductEntity(name: 'name', regularPrice: 150, actualPrice: 50);
  });
  test('Should return -66.66666666666666 when call discountPercentage', () {
    expect(product.discountPercentage, -66.66666666666666);
  });
}
