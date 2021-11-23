import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:crud_products/app/modules/home/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/home/domain/repositories/product_reposity.dart';
import 'package:dartz/dartz.dart';

abstract class FetchProductsUsecaseInterface {
  Future<Either<FailureProductInterface, List<ProductEntity>>> call();
}

class FetchProductsUsecase implements FetchProductsUsecaseInterface {
  final ProductRepositoryInterface repository;

  FetchProductsUsecase({required this.repository});
  @override
  Future<Either<FailureProductInterface, List<ProductEntity>>> call() async {
    return await repository.fetchProducts();
  }
}
