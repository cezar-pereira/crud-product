import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:crud_products/app/modules/product/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/product/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

abstract class RemoveProductUsecaseInterface {
  Future<Either<ErrorRemoveProduct, bool>> call(
      {required ProductEntity product});
}

class RemoveProductUsecase implements RemoveProductUsecaseInterface {
  final ProductRepositoryInterface repository;

  RemoveProductUsecase({required this.repository});

  @override
  Future<Either<ErrorRemoveProduct, bool>> call(
      {required ProductEntity product}) async {
    return await repository.removeProduct(product: product);
  }
}
