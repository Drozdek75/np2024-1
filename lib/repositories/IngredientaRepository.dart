import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:np2024_01/models/products/Ingredient.dart';
import 'package:np2024_01/models/products/IngredientType.dart';
import 'package:np2024_01/models/products/Product.dart';

class IngredientsRepository {
  final String path = 'http://95.249.90.164:8080/env/getAllIngredients';
  final String pathType = 'http://95.249.90.164:8080/env/getAllIngredientType';
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

  Future<void> getAllIngredientType() async {
    final response = await dio.get(pathType);
    List<dynamic> lst = response.data;
    lst.forEach(
      (element) {
        print(element['name']);
      },
    );
  }
}

class listIng {
  List<Ingredient> lst = [];

  listIng({required this.lst});
}
