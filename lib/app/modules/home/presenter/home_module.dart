import 'package:crud_products/app/modules/product/presenter/product_module.dart';

import 'package:crud_products/app/modules/home/domain/repositories/product_reposity.dart';
import 'package:crud_products/app/modules/home/domain/usecases/fetch_products_usecase.dart';
import 'package:crud_products/app/modules/home/external/datasources/product_hive_datasource.dart';
import 'package:crud_products/app/modules/home/infra/datasources/produtc_datasource.dart';
import 'package:crud_products/app/modules/home/infra/repositories/product_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'blocs/fetch_products_bloc.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        ProductModule(),
      ];
  @override
  final List<Bind> binds = [
    /*** BLOCS ***/
    Bind.lazySingleton((i) =>
        FetchProductsBloc(useCase: i.get<FetchProductsUsecaseInterface>())),

    /*** DATASOURCES  ***/
    Bind.lazySingleton((i) => ProductHiveDataSource()),

    /*** REPOSITORIES  ***/
    Bind.lazySingleton((i) =>
        ProductRrepository(dataSource: i.get<ProductDatasourceInterface>())),

    /*** USECASES  ***/
    Bind.lazySingleton((i) =>
        FetchProductsUsecase(repository: i.get<ProductRepositoryInterface>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
