class CartItemModel {
  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;
  final double price;
  final int quantity;
  final int discountPercentage;
  final String color;

  CartItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
    required this.price,
    required this.quantity,
    required this.discountPercentage,
    required this.color,
  });

  static CartItemModel fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      coverPictureUrl: json['coverPictureUrl'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      quantity: json['quantity'] as int? ?? 1,
      discountPercentage: json['discountPercentage'] as int? ?? 0,
      color: json['color'] ?? '',
    );
  }
}
