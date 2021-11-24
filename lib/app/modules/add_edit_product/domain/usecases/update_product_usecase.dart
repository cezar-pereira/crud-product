import 'package:crud_products/app/modules/add_edit_product/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/add_edit_product/domain/repositories/product_repository.dart';
import 'package:crud_products/app/modules/home/infra/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class UpdateProductUsecaseInterface {
  Future<Either<ErrorUpdateProduct, bool>> call(
      {required ProductModel productModel});
}

class UpdateProductUsecase implements UpdateProductUsecaseInterface {
  final ProductRepositoryInterface repository;

  UpdateProductUsecase({required this.repository});
  @override
  Future<Either<ErrorUpdateProduct, bool>> call(
      {required ProductModel productModel}) async {
    return await repository.updateProduct(productModel: productModel);
  }
}
