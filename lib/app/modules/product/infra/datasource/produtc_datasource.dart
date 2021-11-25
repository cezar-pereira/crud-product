import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';

abstract class ProductDatasourceInterface {
  Future<bool> saveProduct({required ProductEntity product});
  Future<bool> updateProduct({required ProductEntity product});
  Future<bool> removeProduct({required ProductEntity product});
}
