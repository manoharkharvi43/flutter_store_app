import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/blocs/product_bloc/product_event.dart';
import 'package:store_app/blocs/product_bloc/product_state.dart';
import 'package:store_app/repository/product_repository.dart';

class ProductBloc extends Bloc<LoadProductEvent, ProductState> {
  final ProductRepo productRepository;
  var allProducts = ProductRepo();
  ProductBloc({
    required this.productRepository
}) : super(ProductLoadingState()) {
    on((event, emit) async {
      emit(ProductLoadingState());
      try {
        final products = await allProducts.GetProductsApi();
        emit(ProductLoadedState(products));
      } catch (err) {
        emit(ProductErrorState(err));
      }
    });
  }
}
