import 'package:np2024_01/models/products/Ingredient.dart';
import 'package:np2024_01/repositories/IngredientaRepository.dart';

class Product {
  int? id;
  String? name;
  String? description;
  double? price;
  double? cost;
  String? notes;
  int? version;
  String? type;
  List<Ingredient>? ingredientsList = [];
  List<String>? orderDetailF = [];
  List<String>? productOrder = [];

  Product(
      {required this.name,
      required this.description,
      required this.cost,
      required this.ingredientsList,
      required this.price,
      required this.notes,
      required this.version,
      required this.type,
      required this.orderDetailF,
      required this.productOrder,
      required this.id});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    cost = json['cost'];
    if (json['ingredientsList'] != null) {
      json['ingedientsList'].forEach((v) {
        ingredientsList!.add(Ingredient.fromJson(v.fromJson(v)));
      });
    }
    price = json['price'];
    notes = json['notes'];
    version = json['version'];
    type = json['type'];
    orderDetailF = json['orderdetailF'];
    productOrder = json['productOrder'];
  }
}

class ListIngredients {
  static List<Ingredient> lstIngredient = [];

   ListIngredients();

  static void addIngredient(Ingredient p) {
    lstIngredient.add(p);
  }

  static List<Ingredient> getListIngredient() {
    return lstIngredient;
  }
}



class listProducts {
  static List<Product> lstProduct = [];

  listProducts();

  static void addProduct(Product p) {
    lstProduct.add(p);
  }

  static List<Product> getListProduct() {
    return lstProduct;
  }
}
