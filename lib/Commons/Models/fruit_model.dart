class FruitModel {
  final int id;
  final String name;
  final int price;
  final String description;
  final String url;
  final String category;

  FruitModel({
    required this.description,
    required this.id,
    required this.name,
    required this.price,
    required this.url,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['price_per_kg'] = price;
    data['description'] = description;
    data['url'] = url;
    data['category'] = category;

    return data;
  }

  factory FruitModel.fromJson(Map<String, dynamic> json) {
    return FruitModel(
      description: json['description'],
      id: json['id'],
      name: json['name'],
      price: json['price_per_kg'],
      url: json['url'],
      category: json['category'],
    );
  }
}
