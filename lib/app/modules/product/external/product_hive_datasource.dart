import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:crud_products/app/modules/product/infra/datasource/produtc_datasource.dart';
import 'package:crud_products/app/modules/home/infra/models/hive/product_model_hive.dart';
import 'dart:developer' as developer;

import 'package:hive/hive.dart';

class ProductHiveDataSource implements ProductDatasourceInterface {
  @override
  Future<bool> removeProduct({required ProductEntity product}) async {
    try {
      product as ProductModelHive;
      await product.delete();
      return true;
    } catch (e, stackTrace) {
      developer.log('ERROR: $e', name: 'RemoveProduct', stackTrace: stackTrace);
      throw Exception('$e');
    }
  }

  @override
  Future<bool> saveProduct({required ProductEntity product}) async {
    try {
      product as ProductModelHive;
      var box = await Hive.openBox<ProductModelHive>('products');
      await box.add(product);
      return true;
    } catch (e, stackTrace) {
      developer.log('ERROR: $e', name: 'SaveProduct', stackTrace: stackTrace);
      throw Exception('$e');
    }
  }

  @override
  Future<bool> updateProduct({required ProductEntity product}) async {
    try {
      product as ProductModelHive;
      await product.save();
      return true;
    } catch (e, stackTrace) {
      developer.log('ERROR: $e', name: 'UpdateProduct', stackTrace: stackTrace);
      throw Exception('$e');
    }
  }
}
