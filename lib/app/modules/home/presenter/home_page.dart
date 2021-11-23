import 'package:crud_products/app/modules/home/presenter/components/text_field_search_component.dart';
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
                          onPressed: (_) {},
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.red,
                          icon: Icons.delete,
                          label: 'Remover',
                        ),
                        SlidableAction(
                          onPressed: (_) {},
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
    );
  }
}
