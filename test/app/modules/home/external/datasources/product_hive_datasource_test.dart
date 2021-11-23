import 'package:crud_products/app/modules/home/infra/datasources/produtc_datasource.dart';
import 'package:crud_products/app/modules/home/infra/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ProductHiveDataSourceMock extends Mock
    implements ProductDatasourceInterface {}

void main() {
  late final ProductDatasourceInterface dataSource;

  setUpAll(() {
    dataSource = ProductHiveDataSourceMock();
  });
  test('Should return List<ProductEntity>', () async {
    List<ProductModel> list = [];
    when(() => dataSource.fetchProducts()).thenAnswer((_) async => list);
    var result = await dataSource.fetchProducts();
    expect(result, list);
    verify(() => dataSource.fetchProducts()).called(1);
  });
}
