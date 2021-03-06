import 'package:crud_products/app/modules/product/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/product/domain/repositories/product_repository.dart';
import 'package:crud_products/app/modules/product/domain/usecases/remove_product_usecase.dart';

import 'package:crud_products/app/modules/home/infra/models/hive/product_model_hive.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'fakes/product_fake.dart';

class ProductRepositoryMock extends Mock implements ProductRepositoryInterface {
}

void main() {
  late final ProductRepositoryInterface repository;
  late final RemoveProductUsecaseInterface useCase;
  late final ProductModelHive product;

  setUpAll(() {
    product = ProductModelHive.fromMap(map: dataFake[0]);
    repository = ProductRepositoryMock();
    useCase = RemoveProductUsecase(repository: repository);
  });

  test('Should return TRUE', () async {
    when(() => repository.removeProduct(product: product))
        .thenAnswer((_) async => const Right(true));
    var result = await useCase(product: product);
    expect(result, const Right(true));
    verify(() => repository.removeProduct(product: product)).called(1);
  });
  test('Should return ErrorRemoveProduct', () async {
    var error = ErrorRemoveProduct(message: 'error');
    when(() => repository.removeProduct(product: product))
        .thenAnswer((_) async => Left(error));
    var result = await useCase(product: product);
    expect(result, Left(error));
    verify(() => repository.removeProduct(product: product)).called(1);
  });
}
