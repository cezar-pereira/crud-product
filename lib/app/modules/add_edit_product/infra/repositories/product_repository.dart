import 'package:crud_products/app/modules/add_edit_product/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/add_edit_product/domain/repositories/product_repository.dart';
import 'package:crud_products/app/modules/add_edit_product/infra/datasource/produtc_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:crud_products/app/modules/home/infra/models/product_model.dart';

class ProductRepository implements ProductRepositoryInterface {
  final ProductDatasourceInterface dataSource;

  ProductRepository({required this.dataSource});
  @override
  Future<Either<ErrorRemoveProduct, bool>> removeProduct(
      {required ProductModel productModel}) async {
    try {
      var result = await dataSource.removeProduct(productModel: productModel);
      return Right(result);
    } catch (e) {
      return Left(ErrorRemoveProduct(message: 'Erro ao remover produto $e'));
    }
  }

  @override
  Future<Either<ErrorSaveProduct, bool>> saveProduct(
      {required ProductModel productModel}) async {
    try {
      var result = await dataSource.saveProduct(productModel: productModel);
      return Right(result);
    } catch (e) {
      return Left(ErrorSaveProduct(message: 'Erro ao salvar produto $e'));
    }
  }

  @override
  Future<Either<ErrorUpdateProduct, bool>> updateProduct(
      {required ProductModel productModel}) async {
    try {
      var result = await dataSource.updateProduct(productModel: productModel);
      return Right(result);
    } catch (e) {
      return Left(ErrorUpdateProduct(message: 'Erro ao atualizar produto $e'));
    }
  }
}
