class IngredientType {
  int? id;
  String? name;

  IngredientType({required this.id, required this.name});

  IngredientType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
