import 'package:crud_products/app/modules/product/domain/usecases/remove_product_usecase.dart';
import 'package:crud_products/app/modules/product/domain/usecases/save_product_usecase.dart';
import 'package:crud_products/app/modules/product/domain/usecases/update_product_usecase.dart';
import 'package:crud_products/app/modules/home/infra/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_states.dart';

class ProductBloc extends Cubit<EmptyState> {
  ProductBloc(
      {required this.saveProductUsecase,
      required this.updateProductUsecase,
      required this.removeProductUsecase})
      : super(EmptyState());

  final SaveProductUsecaseInterface saveProductUsecase;
  final UpdateProductUsecaseInterface updateProductUsecase;
  final RemoveProductUsecaseInterface removeProductUsecase;

  saveProduct({required ProductModel productModel}) {}
  updateProduct({required ProductModel productModel}) {}
  removeProduct({required ProductModel productModel}) {}
}
