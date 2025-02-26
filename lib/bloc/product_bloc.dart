import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:np2024_01/models/products/Ingredient.dart';
import 'package:np2024_01/models/products/Product.dart';
import 'package:np2024_01/repositories/IngredientaRepository.dart';
import 'package:np2024_01/repositories/ProductsRepository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  Productsrepository productRepo;
  IngredientsRepository ingredientRepo;
  ProductBloc({required this.productRepo, required this.ingredientRepo})
      : super(ProductInitial()) {
    on<productLoad>(
      (event, emit) async {
        List<Product> lst;
        await productRepo.getAllProducts().then(
          (value) {
            lst = value;
            lst.sort(
              (a, b) => a.name!.compareTo(b.name!),
            );
            emit(ProductLoad(productList: lst));
          },
        );
        // emit()
      },
    );

    on<ProductLoadStartWith>(
      (event, emit) async {
        List<Product> lst = [];
        var lst_temp;
        await productRepo.getAllProducts().then(
          (value) {
            lst_temp = value.where(
              (element) => element.name!.startsWith(
                  RegExp('^[${event.letter[0]},${event.letter[1]}]')),
            );
            print('------>${lst_temp.toList()}');
            lst = lst_temp.toList();
            lst.sort(
              (a, b) => a.name!.compareTo(b.name!),
            );
          },
        );
        emit(ProductLoad(productList: lst));
        // emit()
      },
    );

    on<ProductFilterByCategory>(
      (event, emit) async {
        List<Product> lst = [];
        var lst_temp;
        await productRepo.getAllProducts().then(
          (value) {
            lst = value
                .where(
                  (element) => element.type == event.category,
                )
                .toList();
          },
        );
        lst.sort(
          (a, b) => a.name!.compareTo(b.name!),
        );
        emit(ProductLoad(productList: lst));
        // emit()
      },
    );

    on<IngredientLoadStartWith>(
      (event, emit) async {
        List<Ingredient> lst = [];
        var lst_temp;
        await ingredientRepo.getAllIngredients().then(
          (value) {
            lst_temp = value.where(
              (element) => element.name!.startsWith(
                  RegExp('^[${event.letter[0]},${event.letter[1]}]')),
            );
            print('------>${lst_temp.toList()}');
            lst = lst_temp.toList();
            lst.sort(
              (a, b) => a.name!.compareTo(b.name!),
            );
          },
        );
        emit(IngredientLoad(ingredientList: lst));
        // emit()
      },
    );

    on<ingredientLoad>(
      (event, emit) async {
        List<Ingredient> lst = [];
        var lst_temp;
        await ingredientRepo.getAllIngredients().then(
          (value) {
            print(value);
            emit(IngredientLoad(ingredientList: value));
          },
        );
      },
    );

    on<IngredientTypeLoad>((event, emit) async {
      await ingredientRepo.getAllIngredientType();
    });
  }

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
