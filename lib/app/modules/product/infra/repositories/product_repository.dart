import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:crud_products/app/modules/product/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/product/domain/repositories/product_repository.dart';
import 'package:crud_products/app/modules/product/infra/datasource/produtc_datasource.dart';
import 'package:dartz/dartz.dart';

class ProductRepository implements ProductRepositoryInterface {
  final ProductDatasourceInterface dataSource;

  ProductRepository({required this.dataSource});
  @override
  Future<Either<ErrorRemoveProduct, bool>> removeProduct(
      {required ProductEntity product}) async {
    try {
      var result = await dataSource.removeProduct(product: product);
      return Right(result);
    } catch (e) {
      return Left(ErrorRemoveProduct(message: 'Erro ao remover produto $e'));
    }
  }

  @override
  Future<Either<ErrorSaveProduct, bool>> saveProduct(
      {required ProductEntity product}) async {
    try {
      var result = await dataSource.saveProduct(product: product);
      return Right(result);
    } catch (e) {
      return Left(ErrorSaveProduct(message: 'Erro ao salvar produto $e'));
    }
  }

  @override
  Future<Either<ErrorUpdateProduct, bool>> updateProduct(
      {required ProductEntity product}) async {
    try {
      var result = await dataSource.updateProduct(product: product);
      return Right(result);
    } catch (e) {
      return Left(ErrorUpdateProduct(message: 'Erro ao atualizar produto $e'));
    }
  }
}
