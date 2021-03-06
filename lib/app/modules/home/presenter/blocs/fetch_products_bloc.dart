import 'package:bloc/bloc.dart';
import 'package:crud_products/app/modules/home/domain/entities/product_entity.dart';
import 'package:crud_products/app/modules/home/domain/errors/errors_product.dart';
import 'package:crud_products/app/modules/home/domain/usecases/fetch_products_usecase.dart';
import 'package:crud_products/app/shared/functions/remove_diacritics.dart';

abstract class FetchProductsState {}

class FetchProductsStateSuccess implements FetchProductsState {
  final List<ProductEntity> data;
  FetchProductsStateSuccess({required this.data});
}

class FetchProductsStateLoading implements FetchProductsState {}

class FetchProductsStateError implements FetchProductsState {
  final FailureProductInterface error;

  FetchProductsStateError({required this.error});
}

class FetchProductsBloc extends Cubit<FetchProductsState> {
  FetchProductsBloc({required this.useCase})
      : super(FetchProductsStateLoading());

  final FetchProductsUsecaseInterface useCase;

  List<ProductEntity> products = [];

  fetchProducts() async {
    var result = await useCase.call();
    result.fold((l) => emit(FetchProductsStateError(error: l)), (r) {
      products = r;
      products
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      emit(FetchProductsStateSuccess(data: products));
    });
  }

  filterProducts({String value = ''}) {
    if (value.isEmpty) {
      emit(FetchProductsStateSuccess(data: products));
    } else {
      var filter = products
          .where((element) =>
              removeDiacritics(value: element.name.toLowerCase())
                  .contains(removeDiacritics(value: value.toLowerCase())))
          .toList();
      emit(FetchProductsStateSuccess(data: filter));
    }
  }
}
