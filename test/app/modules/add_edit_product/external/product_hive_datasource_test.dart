import 'package:crud_products/app/modules/add_edit_product/infra/datasource/produtc_datasource.dart';
import 'package:crud_products/app/modules/home/infra/models/hive/product_model_hive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../domain/usecases/fakes/product_fake.dart';

class ProductHiveDataSourceMock extends Mock
    implements ProductDatasourceInterface {}

void main() {
  late final ProductDatasourceInterface dataSource;
  late final ProductModelHive productModel;
  setUpAll(() {
    productModel = ProductModelHive.fromMap(map: dataFake[0]);
    dataSource = ProductHiveDataSourceMock();
  });

  test('Should return TRUE when call saveProduct', () async {
    when(() => dataSource.saveProduct(productModel: productModel))
        .thenAnswer((invocation) async => true);
    var result = await dataSource.saveProduct(productModel: productModel);
    expect(result, true);
  });

  test('Should return TRUE when call updateProduct', () async {
    when(() => dataSource.updateProduct(productModel: productModel))
        .thenAnswer((invocation) async => true);
    var result = await dataSource.updateProduct(productModel: productModel);
    expect(result, true);
  });
  test('Should return TRUE when call removeProduct', () async {
    when(() => dataSource.removeProduct(productModel: productModel))
        .thenAnswer((invocation) async => true);
    var result = await dataSource.removeProduct(productModel: productModel);
    expect(result, true);
  });
}
