import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:crud_products/app/modules/home/infra/datasources/produtc_datasource.dart';

class ProductHiveDataSource implements ProductDatasourceInterface {
  @override
  Future<List<ProductEntity>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 3));
    return [];
  }
}
