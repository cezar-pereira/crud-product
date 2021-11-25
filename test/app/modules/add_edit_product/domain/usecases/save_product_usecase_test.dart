import 'package:crud_products/app/modules/product/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/product/domain/repositories/product_repository.dart';
import 'package:crud_products/app/modules/product/domain/usecases/save_product_usecase.dart';
import 'package:crud_products/app/modules/home/infra/models/hive/product_model_hive.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'fakes/product_fake.dart';

class ProductRepositoryMock extends Mock implements ProductRepositoryInterface {
}

void main() {
  late final ProductRepositoryInterface repository;
  late final SaveProductUsecaseInterface useCase;
  late final ProductModelHive product;

  setUpAll(() {
    product = ProductModelHive.fromMap(map: dataFake[0]);
    repository = ProductRepositoryMock();
    useCase = SaveProductUsecase(repository: repository);
  });

  test('Should return TRUE', () async {
    when(() => repository.saveProduct(product: product))
        .thenAnswer((_) async => const Right(true));
    var result = await useCase(product: product);
    expect(result, const Right(true));
    verify(() => repository.saveProduct(product: product)).called(1);
  });
  test('Should return ErrorSaveProduct', () async {
    var error = ErrorSaveProduct(message: 'error');
    when(() => repository.saveProduct(product: product))
        .thenAnswer((_) async => Left(error));
    var result = await useCase(product: product);
    expect(result, Left(error));
    verify(() => repository.saveProduct(product: product)).called(1);
  });
}
