import 'package:crud_products/app/modules/add_edit_product/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/add_edit_product/domain/repositories/product_repository.dart';
import 'package:crud_products/app/modules/home/infra/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class SaveProductUsecaseInterface {
  Future<Either<ErrorSaveProduct, bool>> call(
      {required ProductModel productModel});
}

class SaveProductUsecase implements SaveProductUsecaseInterface {
  final ProductRepositoryInterface repository;

  SaveProductUsecase({required this.repository});
  @override
  Future<Either<ErrorSaveProduct, bool>> call(
      {required ProductModel productModel}) async {
    return await repository.saveProduct(productModel: productModel);
  }
}
