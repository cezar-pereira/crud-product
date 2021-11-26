import 'package:crud_products/app/modules/home/db_fake.dart';
import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:crud_products/app/modules/home/infra/models/hive/product_model_hive.dart';
import 'package:crud_products/app/modules/home/presenter/components/text_field_search_component.dart';
import 'package:crud_products/app/modules/product/presenter/blocs/product_controller.dart';
import 'package:crud_products/app/shared/components/build_show_dialog.dart';
import 'package:crud_products/app/shared/components/dialog_confirm_component.dart';
import 'package:crud_products/app/shared/components/snackbar_error_custom_component.dart';
import 'package:crud_products/app/shared/components/snackbar_success_custom_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'blocs/fetch_products_bloc.dart';
import 'components/card_product_component.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, FetchProductsBloc> {
  @override
  void initState() {
    store.fetchProducts();
    super.initState();
  }

  @override
  void dispose() {
    store.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          TextButton(
              onPressed: () {
                initialCharge();
              },
              child: const Text(
                'Carga Inicial',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
      body: BlocBuilder<FetchProductsBloc, FetchProductsState>(
        bloc: store,
        builder: (context, state) {
          if (state is FetchProductsStateError) {
            return Center(child: Text(state.error.message));
          }
          if (state is FetchProductsStateLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          state as FetchProductsStateSuccess;
          return Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFieldSearchComponent(
                  onChanged: (value) {
                    store.filterProducts(value: value);
                  },
                ),
              ),
              Expanded(
                  child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) async {
                            _removeProduct(product: state.data[index]);
                          },
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.red,
                          icon: Icons.delete,
                          label: 'Remover',
                        ),
                        SlidableAction(
                          onPressed: (_) {
                            Modular.to
                                .pushNamed('/product/',
                                    arguments: state.data[index])
                                .then((value) {
                              if (value == true) {
                                store.fetchProducts();
                              }
                            });
                          },
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.blue,
                          icon: Icons.edit,
                          label: 'Editar',
                        ),
                      ],
                    ),
                    child: CardProductComponent(product: state.data[index]),
                  );
                },
                separatorBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  height: 2,
                  width: double.maxFinite,
                  color: Colors.black12,
                ),
              ))
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Modular.to.pushNamed('/product/').then((value) {
              if (value == true) {
                store.fetchProducts();
              }
            });
          }),
    );
  }

  _removeProduct({required ProductEntity product}) async {
    var response = await _dialogConfirmRemoveProduct(product: product);
    if (response) {
      var result = await Modular.get<ProductController>()
          .removeProductUsecase
          .call(product: product);
      result.fold((error) {
        SnackBarErrorCustom(context: context, error: error.message).call();
      }, (_) {
        SnackBarSuccessCustom(
                context: context, success: 'Produto excluído com sucesso.')
            .call();
        store.fetchProducts();
      });
    }
  }

  Future<bool> _dialogConfirmRemoveProduct(
      {required ProductEntity product}) async {
    var result = await BuildShowDialog(
      context: context,
      widget: DialogConfirmComponent(
        title: 'Confirmar exclusão',
        content: 'Deseja excluir o produto ${product.name}?',
      ),
    ).call();
    return result;
  }

  void initialCharge() async {
    for (var item in dbFake) {
      var product = ProductModelHive.fromMap(map: item);
      await Modular.get<ProductController>()
          .saveProductUsecase
          .call(product: product);
    }

    store.fetchProducts();
  }
}
