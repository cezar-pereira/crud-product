import 'package:crud_products/app/modules/add_edit_product/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/add_edit_product/domain/repositories/product_repository.dart';
import 'package:crud_products/app/modules/home/infra/models/hive/product_model_hive.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/usecases/fakes/product_fake.dart';

class ProductRepositoryMock extends Mock implements ProductRepositoryInterface {
}

void main() {
  late final ProductRepositoryInterface repository;
  late final ProductModelHive productModel;

  setUpAll(() {
    productModel = ProductModelHive.fromMap(map: dataFake[0]);
    repository = ProductRepositoryMock();
  });

  group('saveProduct:', () {
    test('Should return TRUE', () async {
      when(() => repository.saveProduct(productModel: productModel))
          .thenAnswer((_) async => const Right(true));
      var result = await repository.saveProduct(productModel: productModel);
      expect(result, const Right(true));
    });
    test('Should return ErrorSaveProduct', () async {
      var error = ErrorSaveProduct(message: 'error');
      when(() => repository.saveProduct(productModel: productModel))
          .thenAnswer((_) async => Left(error));
      var result = await repository.saveProduct(productModel: productModel);
      expect(result, Left(error));
    });
  });
  group('updateProduct:', () {
    test('Should return TRUE', () async {
      when(() => repository.updateProduct(productModel: productModel))
          .thenAnswer((_) async => const Right(true));
      var result = await repository.updateProduct(productModel: productModel);
      expect(result, const Right(true));
    });
    test('Should return ErrorUpdateProduct', () async {
      var error = ErrorUpdateProduct(message: 'error');
      when(() => repository.updateProduct(productModel: productModel))
          .thenAnswer((_) async => Left(error));
      var result = await repository.updateProduct(productModel: productModel);
      expect(result, Left(error));
    });
  });
  group('removeProduct:', () {
    test('Should return TRUE', () async {
      when(() => repository.removeProduct(productModel: productModel))
          .thenAnswer((_) async => const Right(true));
      var result = await repository.removeProduct(productModel: productModel);
      expect(result, const Right(true));
    });
    test('Should return ErrorRemoveProduct', () async {
      var error = ErrorRemoveProduct(message: 'error');
      when(() => repository.removeProduct(productModel: productModel))
          .thenAnswer((_) async => Left(error));
      var result = await repository.removeProduct(productModel: productModel);
      expect(result, Left(error));
    });
  });
}
