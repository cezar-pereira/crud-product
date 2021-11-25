import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:crud_products/app/modules/product/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/product/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SaveProductUsecaseInterface {
  Future<Either<ErrorSaveProduct, bool>> call({required ProductEntity product});
}

class SaveProductUsecase implements SaveProductUsecaseInterface {
  final ProductRepositoryInterface repository;

  SaveProductUsecase({required this.repository});
  @override
  Future<Either<ErrorSaveProduct, bool>> call(
      {required ProductEntity product}) async {
    return await repository.saveProduct(product: product);
  }
}
