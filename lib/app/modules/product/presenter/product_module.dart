import 'package:crud_products/app/modules/product/domain/repositories/product_repository.dart';
import 'package:crud_products/app/modules/product/domain/usecases/remove_product_usecase.dart';
import 'package:crud_products/app/modules/product/domain/usecases/save_product_usecase.dart';
import 'package:crud_products/app/modules/product/domain/usecases/update_product_usecase.dart';
import 'package:crud_products/app/modules/product/external/product_hive_datasource.dart';
import 'package:crud_products/app/modules/product/infra/datasource/produtc_datasource.dart';
import 'package:crud_products/app/modules/product/infra/repositories/product_repository.dart';
import 'package:crud_products/app/modules/product/presenter/product_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'blocs/product_controller.dart';

class ProductModule extends Module {
  @override
  final List<Bind> binds = [
    /*** BLOCS ***/
    Bind.lazySingleton(
        (i) => ProductController(
              removeProductUsecase: i.get<RemoveProductUsecaseInterface>(),
              saveProductUsecase: i.get<SaveProductUsecaseInterface>(),
              updateProductUsecase: i.get<UpdateProductUsecaseInterface>(),
            ),
        export: true),

    /*** DATASOURCES  ***/
    Bind.lazySingleton((i) => ProductHiveDataSource(), export: true),

    /*** REPOSITORIES  ***/
    Bind.lazySingleton(
        (i) =>
            ProductRepository(dataSource: i.get<ProductDatasourceInterface>()),
        export: true),

    /*** USECASES  ***/
    Bind.lazySingleton(
        (i) =>
            SaveProductUsecase(repository: i.get<ProductRepositoryInterface>()),
        export: true),
    Bind.lazySingleton(
        (i) => UpdateProductUsecase(
            repository: i.get<ProductRepositoryInterface>()),
        export: true),
    Bind.lazySingleton(
        (i) => RemoveProductUsecase(
            repository: i.get<ProductRepositoryInterface>()),
        export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => ProductPage(product: args.data)),
  ];
}
