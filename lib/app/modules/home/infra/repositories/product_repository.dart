import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:crud_products/app/modules/home/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/home/domain/repositories/product_reposity.dart';
import 'package:crud_products/app/modules/home/infra/datasources/produtc_datasource.dart';
import 'package:dartz/dartz.dart';

class ProductRrepository implements ProductRepositoryInterface {
  final ProductDatasourceInterface dataSource;

  ProductRrepository({required this.dataSource});

  @override
  Future<Either<FailureProductInterface, List<ProductEntity>>>
      fetchProducts() async {
    try {
      var result = await dataSource.fetchProducts();
      return Right(result);
    } catch (e) {
      return Left(ErrorFetchProducts(message: 'Erro ao buscar produtos'));
    }
  }
}
