import 'package:crud_products/app/modules/add_edit_product/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/add_edit_product/domain/repositories/product_repository.dart';
import 'package:crud_products/app/modules/home/infra/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class RemoveProductUsecaseInterface {
  Future<Either<ErrorRemoveProduct, bool>> call(
      {required ProductModel productModel});
}

class RemoveProductUsecase implements RemoveProductUsecaseInterface {
  final ProductRepositoryInterface repository;

  RemoveProductUsecase({required this.repository});

  @override
  Future<Either<ErrorRemoveProduct, bool>> call(
      {required ProductModel productModel}) async {
    return await repository.removeProduct(productModel: productModel);
  }
}
