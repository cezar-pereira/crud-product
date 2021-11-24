import 'package:crud_products/app/modules/home/infra/models/product_model.dart';

abstract class ProductDatasourceInterface {
  Future<bool> saveProduct({required ProductModel productModel});
  Future<bool> updateProduct({required ProductModel productModel});
  Future<bool> removeProduct({required ProductModel productModel});
}
