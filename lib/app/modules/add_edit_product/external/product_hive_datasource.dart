import 'package:crud_products/app/modules/add_edit_product/infra/datasource/produtc_datasource.dart';
import 'package:crud_products/app/modules/home/infra/models/hive/product_model_hive.dart';
import 'package:crud_products/app/modules/home/infra/models/product_model.dart';
import 'dart:developer' as developer;

import 'package:hive/hive.dart';

class ProductHiveDataSource implements ProductDatasourceInterface {
  @override
  Future<bool> removeProduct({required ProductModel productModel}) async {
    try {
      productModel as ProductModelHive;
      await productModel.delete();
      return true;
    } catch (e, stackTrace) {
      developer.log('ERROR: $e', name: 'RemoveProduct', stackTrace: stackTrace);
      throw Exception('$e');
    }
  }

  @override
  Future<bool> saveProduct({required ProductModel productModel}) async {
    try {
      productModel as ProductModelHive;
      var box = await Hive.openBox<ProductModelHive>('products');
      await box.add(productModel);
      return true;
    } catch (e, stackTrace) {
      developer.log('ERROR: $e', name: 'SaveProduct', stackTrace: stackTrace);
      throw Exception('$e');
    }
  }

  @override
  Future<bool> updateProduct({required ProductModel productModel}) async {
    try {
      productModel as ProductModelHive;
      await productModel.save();
      return true;
    } catch (e, stackTrace) {
      developer.log('ERROR: $e', name: 'UpdateProduct', stackTrace: stackTrace);
      throw Exception('$e');
    }
  }
}
