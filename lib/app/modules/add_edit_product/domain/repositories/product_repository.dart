import 'package:crud_products/app/modules/add_edit_product/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/home/infra/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepositoryInterface {
  Future<Either<ErrorSaveProduct, bool>> saveProduct(
      {required ProductModel productModel});
  Future<Either<ErrorUpdateProduct, bool>> updateProduct(
      {required ProductModel productModel});
  Future<Either<ErrorRemoveProduct, bool>> removeProduct(
      {required ProductModel productModel});
}
