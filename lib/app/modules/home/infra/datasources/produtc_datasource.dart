import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';

abstract class ProductDatasourceInterface {
  Future<List<ProductEntity>> fetchProducts();
}
