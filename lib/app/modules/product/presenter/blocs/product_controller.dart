import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:crud_products/app/modules/home/domain/entities/size_product_entity.dart';
import 'package:crud_products/app/modules/home/infra/models/hive/product_model_hive.dart';
import 'package:crud_products/app/modules/home/infra/models/hive/size_product_model_hive.dart';
import 'package:crud_products/app/modules/product/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/product/domain/usecases/remove_product_usecase.dart';
import 'package:crud_products/app/modules/product/domain/usecases/save_product_usecase.dart';
import 'package:crud_products/app/modules/product/domain/usecases/update_product_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';

class ProductController {
  ProductController(
      {required this.saveProductUsecase,
      required this.updateProductUsecase,
      required this.removeProductUsecase});

  var nameController = TextEditingController();
  var styleController = TextEditingController();
  var codeColorController = TextEditingController();
  var colorSlugController = TextEditingController();
  var colorController = TextEditingController();
  bool onSale = true;
  var regularPriceController = TextEditingController();
  var actualPriceController = TextEditingController();
  var discountPercentageController = TextEditingController();
  var installmentsController = TextEditingController();
  List<SizeProductModelHive> sizes = [
    SizeProductModelHive(available: false, size: 'PP', sku: '1'),
    SizeProductModelHive(available: false, size: 'P', sku: '2'),
    SizeProductModelHive(available: false, size: 'M', sku: '3'),
    SizeProductModelHive(available: false, size: 'G', sku: '4'),
    SizeProductModelHive(available: false, size: 'GG', sku: '5'),
  ];

  final SaveProductUsecaseInterface saveProductUsecase;
  final UpdateProductUsecaseInterface updateProductUsecase;
  final RemoveProductUsecaseInterface removeProductUsecase;

  Future<Either<ErrorSaveProduct, bool>> saveProduct() async {
    ProductModelHive product = ProductModelHive(
        name: nameController.text,
        style: styleController.text,
        codeColor: codeColorController.text,
        colorSlug: colorSlugController.text,
        color: colorController.text,
        onSale: onSale,
        regularPrice: double.parse(regularPriceController.text),
        actualPrice: actualPriceController.text.isEmpty
            ? null
            : double.parse(actualPriceController.text),
        discountPercentage: discountPercentageController.text.isEmpty
            ? null
            : double.parse(discountPercentageController.text),
        installments: installmentsController.text,
        image: '',
        sizes: sizes);
    return await saveProductUsecase.call(product: product);
  }

  Future<Either<ErrorUpdateProduct, bool>> updateProduct(
      {required ProductEntity product}) async {
    product as ProductModelHive;
    var teste = product.copyWith(
        productHive: product,
        name: nameController.text.isEmpty ? null : nameController.text,
        style: styleController.text.isEmpty ? null : styleController.text,
        codeColor:
            codeColorController.text.isEmpty ? null : codeColorController.text,
        colorSlug:
            colorSlugController.text.isEmpty ? null : colorSlugController.text,
        color: colorController.text.isEmpty ? null : colorController.text,
        onSale: onSale,
        regularPrice: double.parse(regularPriceController.text),
        actualPrice: actualPriceController.text.isEmpty
            ? null
            : double.parse(actualPriceController.text),
        discountPercentage: discountPercentageController.text.isEmpty
            ? null
            : double.parse(discountPercentageController.text),
        installments: installmentsController.text.isEmpty
            ? null
            : installmentsController.text,
        sizes: sizes);

    return await updateProductUsecase.call(product: teste);
  }

  setValuesProduct({required ProductEntity product}) {
    nameController.text = product.name;
    styleController.text = product.style;
    codeColorController.text = product.codeColor;
    colorSlugController.text = product.colorSlug;
    colorController.text = product.color;
    onSale = product.onSale;
    regularPriceController.text = product.regularPrice.toString();
    actualPriceController.text = product.actualPrice.toString();
    discountPercentageController.text = product.discountPercentage.toString();
    installmentsController.text = product.installments;
    _setValuesSizesProduct(sizes: product.sizes);
  }

  _setValuesSizesProduct({required List<SizeProductEntity> sizes}) {
    for (var size in this.sizes) {
      var match = sizes.firstWhereOrNull(
          (element) => element.size.toLowerCase() == size.size.toLowerCase());
      if (match != null) {
        size.available = match.available;
      }
    }
  }
}
