import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:crud_products/app/modules/product/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/product/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

abstract class UpdateProductUsecaseInterface {
  Future<Either<ErrorUpdateProduct, bool>> call(
      {required ProductEntity product});
}

class UpdateProductUsecase implements UpdateProductUsecaseInterface {
  final ProductRepositoryInterface repository;

  UpdateProductUsecase({required this.repository});
  @override
  Future<Either<ErrorUpdateProduct, bool>> call(
      {required ProductEntity product}) async {
    return await repository.updateProduct(product: product);
  }
}
