import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:np2024_01/models/products/Ingredient.dart';
import 'package:np2024_01/models/products/Product.dart';

class IngredientsRepository {
  final String path = 'http://79.41.90.246:8080/env/getAllIngredients';
  final dio = Dio();

  Future<List<Ingredient>> getAllIngredients() async {
    final response = await dio.get(path);
    ListIngredients.lstIngredient.clear();
    List<Ingredient> lstIng = [];

    // print('------------------------------------->${response.data}');

    response.data.forEach((e) {
      Ingredient ing = Ingredient.fromJson(e);
      lstIng.add(ing);
    });
    lstIng.sort((a, b) => a.name!.compareTo(b.name!));
    return lstIng;
  }
}

class listIng {
  List<Ingredient> lst = [];

  listIng({required this.lst});
}
