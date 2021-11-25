import 'package:crud_products/app/modules/product/infra/datasource/produtc_datasource.dart';
import 'package:crud_products/app/modules/home/infra/models/hive/product_model_hive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../domain/usecases/fakes/product_fake.dart';

class ProductHiveDataSourceMock extends Mock
    implements ProductDatasourceInterface {}

void main() {
  late final ProductDatasourceInterface dataSource;
  late final ProductModelHive product;
  setUpAll(() {
    product = ProductModelHive.fromMap(map: dataFake[0]);
    dataSource = ProductHiveDataSourceMock();
  });

  test('Should return TRUE when call saveProduct', () async {
    when(() => dataSource.saveProduct(product: product))
        .thenAnswer((invocation) async => true);
    var result = await dataSource.saveProduct(product: product);
    expect(result, true);
  });

  test('Should return TRUE when call updateProduct', () async {
    when(() => dataSource.updateProduct(product: product))
        .thenAnswer((invocation) async => true);
    var result = await dataSource.updateProduct(product: product);
    expect(result, true);
  });
  test('Should return TRUE when call removeProduct', () async {
    when(() => dataSource.removeProduct(product: product))
        .thenAnswer((invocation) async => true);
    var result = await dataSource.removeProduct(product: product);
    expect(result, true);
  });
}
