import 'package:crud_products/app/modules/home/infra/datasources/produtc_datasource.dart';
import 'package:crud_products/app/modules/home/infra/models/hive/product_model_hive.dart';
import 'package:crud_products/app/modules/home/infra/models/product_model.dart';
import 'package:hive/hive.dart';

class ProductHiveDataSource implements ProductDatasourceInterface {
  @override
  Future<List<ProductModel>> fetchProducts() async {
    var box = await Hive.openBox<ProductModelHive>('products');
    return box.values.toList();
  }
}
