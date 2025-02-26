part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class productLoad extends ProductEvent {}

class ingredientLoad extends ProductEvent {}

class productLoadPrice extends ProductEvent {}

class ProductLoadStartWith extends ProductEvent {
  List<String> letter;

  ProductLoadStartWith({required this.letter});
}

class IngredientLoadStartWith extends ProductEvent {
  List<String> letter;

  IngredientLoadStartWith({required this.letter});
}

class ProductFilterByCategory extends ProductEvent {
  String category;

  ProductFilterByCategory({required this.category});
}

class IngredientTypeLoad extends ProductEvent {}
