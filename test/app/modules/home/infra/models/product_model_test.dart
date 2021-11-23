import 'package:crud_products/app/modules/home/infra/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final ProductModel productModel;

  setUpAll(() {
    productModel = ProductModel.fromMap(map: data['products'][0]);
  });

  test('Should create a ProductModel', () {
    expect(productModel, isA<ProductModel>());
  });
}

Map<String, dynamic> data = {
  "products": [
    {
      "id": "1",
      "name": "VESTIDO TRANSPASSE BOW",
      "style": "20002605",
      "code_color": "20002605_613",
      "color_slug": "tapecaria",
      "color": "TAPEÇARIA",
      "on_sale": false,
      "regular_price": r"R$ 199,90",
      "actual_price": r"R$ 199,90",
      "discount_percentage": "",
      "installments": r"3x R$ 66,63",
      "image":
          "https://d3l7rqep7l31az.cloudfront.net/images/products/20002605_615_catalog_1.jpg?1460136912",
      "sizes": [
        {"available": false, "size": "PP", "sku": "5807_343_0_PP"},
        {"available": true, "size": "P", "sku": "5807_343_0_P"},
        {"available": true, "size": "M", "sku": "5807_343_0_M"},
        {"available": true, "size": "G", "sku": "5807_343_0_G"},
        {"available": false, "size": "GG", "sku": "5807_343_0_GG"}
      ]
    }
  ]
};
