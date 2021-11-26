import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:crud_products/app/modules/product/presenter/components/button_size_component.dart';
import 'package:crud_products/app/modules/product/presenter/components/text_form_field_component.dart';
import 'package:crud_products/app/shared/components/build_show_dialog.dart';

import 'package:crud_products/app/shared/components/buttons_components.dart';
import 'package:crud_products/app/shared/components/dialog_confirm_component.dart';
import 'package:crud_products/app/shared/components/snackbar_error_custom_component.dart';
import 'package:crud_products/app/shared/components/snackbar_success_custom_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'blocs/product_controller.dart';
import 'functions/product_validations.dart';

class ProductPage extends StatefulWidget {
  final ProductEntity? product;
  const ProductPage({Key? key, this.product}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends ModularState<ProductPage, ProductController> {
  late ProductValidations _validation;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    if (widget.product != null) {
      store.setValuesProduct(product: widget.product!);
    }
    _validation = ProductValidations();
    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.product == null ? 'ADICIONAR PRODUTO' : 'EDITAR PRODUTO'),
        actions: [
          Visibility(
              visible: widget.product != null,
              child: IconButton(
                  onPressed: () {
                    _removeProduct(product: widget.product!);
                  },
                  icon: const Icon(Icons.delete, color: Colors.red))),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.product != null &&
                      widget.product!.image.isNotEmpty)
                    Hero(
                        tag: widget.product!.image,
                        child: Image.network(widget.product!.image)),
                  TextFormFieldComponent(
                      hint: 'Nome',
                      validation: _validation.name,
                      controller: store.nameController),
                  const SizedBox(height: 20),
                  TextFormFieldComponent(
                      hint: 'Estilo', controller: store.styleController),
                  const SizedBox(height: 20),
                  TextFormFieldComponent(
                      hint: 'Código da Cor',
                      controller: store.codeColorController),
                  const SizedBox(height: 20),
                  TextFormFieldComponent(
                      hint: 'Cor Slug', controller: store.colorSlugController),
                  const SizedBox(height: 20),
                  TextFormFieldComponent(
                      hint: 'Cor', controller: store.colorController),
                  const SizedBox(height: 20),
                  TextFormFieldComponent(
                    hint: 'Preço Normal',
                    prefixText: 'R\$ ',
                    controller: store.regularPriceController,
                    validation: _validation.regularPrice,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                  const SizedBox(height: 20),
                  TextFormFieldComponent(
                    hint: 'Preço Promocional',
                    prefixText: 'R\$ ',
                    controller: store.actualPriceController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                  const SizedBox(height: 20),
                  TextFormFieldComponent(
                    hint: '% de desconto',
                    controller: store.discountPercentageController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  TextFormFieldComponent(
                      hint: 'Parcelamento',
                      controller: store.installmentsController),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Disponível:'),
                      Switch.adaptive(
                          value: store.onSale,
                          onChanged: (value) {
                            setState(() {
                              store.onSale = value;
                            });
                          })
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text('Tamanhos:'),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 60,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ButtonSizeComponent(
                          size: store.sizes[index],
                          onTap: () {
                            setState(() {
                              store.sizes[index].available =
                                  !store.sizes[index].available;
                            });
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 8),
                      itemCount: store.sizes.length,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonsComponents.mediumCancel(
                        onTap: () {
                          Modular.to.pop();
                        },
                        context: context,
                        label: const Text('Cancelar'),
                      ),
                      ButtonsComponents.mediumConfirm(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            if (widget.product == null) {
                              var result = await store.saveProduct();

                              result.fold((error) {
                                SnackBarErrorCustom(
                                        context: context, error: error.message)
                                    .call();
                              }, (r) {
                                SnackBarSuccessCustom(
                                        context: context,
                                        success:
                                            'Produto adicionado com sucesso.')
                                    .call();
                                Modular.to.pop(true);
                              });
                            } else {
                              var result = await store.updateProduct(
                                  product: widget.product!);
                              result.fold((error) {
                                SnackBarErrorCustom(
                                        context: context, error: error.message)
                                    .call();
                              }, (r) {
                                SnackBarSuccessCustom(
                                        context: context,
                                        success:
                                            'Produto atualizado com sucesso.')
                                    .call();
                                Modular.to.pop(true);
                              });
                            }
                          }
                        },
                        context: context,
                        label: Text(
                            widget.product == null ? 'Adicionar' : 'Atualizar'),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  _removeProduct({required ProductEntity product}) async {
    var response = await _dialogConfirmRemoveProduct(product: product);
    if (response) {
      var result = await store.removeProductUsecase.call(product: product);
      result.fold((error) {
        SnackBarErrorCustom(context: context, error: error.message).call();
      }, (_) {
        SnackBarSuccessCustom(
                context: context, success: 'Produto excluído com sucesso.')
            .call();
        Modular.to.pop(true);
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
}
