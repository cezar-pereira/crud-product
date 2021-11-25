import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:crud_products/app/modules/product/domain/errors/errors_product.dart';

import 'package:dartz/dartz.dart';

abstract class ProductRepositoryInterface {
  Future<Either<ErrorSaveProduct, bool>> saveProduct(
      {required ProductEntity product});
  Future<Either<ErrorUpdateProduct, bool>> updateProduct(
      {required ProductEntity product});
  Future<Either<ErrorRemoveProduct, bool>> removeProduct(
      {required ProductEntity product});
}
