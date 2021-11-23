import 'package:crud_products/app/modules/home/infra/models/product_model.dart';

abstract class ProductDatasourceInterface {
  Future<List<ProductModel>> fetchProducts();
}
