import 'package:equatable/equatable.dart';
import 'package:store_app/models/product_models/all_product_model.dart';
import 'package:store_app/repository/product_repository.dart';

abstract class ProductState extends Equatable {}

class ProductLoadingState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductState {
  final List<GetProducts> products;
  ProductLoadedState(this.products);
  @override
  List<Object?> get props => [products];
}

class ProductErrorState extends ProductState {
  final Object error;
  ProductErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
