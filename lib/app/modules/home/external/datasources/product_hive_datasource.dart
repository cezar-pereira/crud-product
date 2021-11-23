import 'package:crud_products/app/modules/home/infra/datasources/produtc_datasource.dart';
import 'package:crud_products/app/modules/home/infra/models/product_model.dart';

class ProductHiveDataSource implements ProductDatasourceInterface {
  @override
  Future<List<ProductModel>> fetchProducts() async {
    return fake.map((e) => ProductModel.fromMap(map: e)).toList();
  }
}

var fake = [
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
  },
  {
    "id": "2",
    "name": "T-SHIRT LEATHER DULL",
    "style": "20002602",
    "code_color": "20002602_027",
    "color_slug": "marinho",
    "color": "MARINHO",
    "on_sale": true,
    "regular_price": r"R$ 139,90",
    "actual_price": r"R$ 119,90",
    "discount_percentage": "12%",
    "installments": r"3x R$ 39,97",
    "image": "",
    "sizes": [
      {"available": true, "size": "PP", "sku": "5793_1000032_0_PP"},
      {"available": true, "size": "P", "sku": "5793_1000032_0_P"},
      {"available": true, "size": "M", "sku": "5793_1000032_0_M"},
      {"available": false, "size": "G", "sku": "5793_1000032_0_G"},
      {"available": false, "size": "GG", "sku": "5793_1000032_0_GG"}
    ]
  }
];
