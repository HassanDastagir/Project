class Product {
  final String name;
  final String image;
  final int price;
  final String description;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  // fromJson constructor to create a Product object from a map (JSON data)
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
    );
  }

  // toJson method to convert a Product object to a map (for sending to an API)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'description': description,
    };
  }
}
