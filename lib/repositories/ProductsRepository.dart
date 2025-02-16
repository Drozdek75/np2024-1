import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:np2024_01/models/products/Ingredient.dart';
import 'package:np2024_01/models/products/Product.dart';

class Productsrepository {
  final String path = 'http://87.14.242.187:8080/env/getAllProducts';
  final dio = Dio();

  Future<List<Product>> getAllProducts() async {
    final response = await dio.get(path);
    listProducts.lstProduct.clear();

    //  final respMap = jsonDecode(response.data);
    response.data.forEach((e) {
      List<Ingredient> lst_ingredient = [];

      //  print('${e['ingredientList']}');

      if (e['ingredientsList'] != null) {
        e['ingredientsList'].forEach((ing) {
          lst_ingredient.add(Ingredient(
              name: ing['name'],
              description: ing['description'],
              cost: ing['cost'],
              id: ing['id'],
              notes: ing['notes'],
              price: ing['price']));
              
        });
      }

      Product p = Product(
          name: e['name'],
          description: e['description'],
          cost: e['cost'],
          ingredientsList: lst_ingredient,
          price: e['price'],
          notes: e['notes'],
          version: e['version'],
          type: e['type'],
          orderDetailF: e['orderDetailF'],
          productOrder: e['productOrder'],
          id: e['id']);

      listProducts.addProduct(p);
    });

    listProducts.lstProduct.forEach((el) {
      //print('${el.name}  - ${el.ingredientsList}');

      el.ingredientsList!.forEach((ingre) {
        //  print(ingre.notes);
        //  print(ingre.name);
      });
    });

    return listProducts.lstProduct;

    //  print(response.data);
  }
}
