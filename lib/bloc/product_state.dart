part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {
  List<Product> productList = listProducts.lstProduct;

  ProductInitial() {}

  @override
  List<Object> get props => [productList];
}

class ProductLoad extends ProductState {
  List<Product> productList;

  ProductLoad({required this.productList});

  @override
  List<Object> get props => [productList];
}

class IngredientLoad extends ProductState {
  List<Ingredient> ingredientList;

  IngredientLoad({required this.ingredientList});

   @override
  List<Object> get props => [ingredientList];
}
