class CartModel {
  final String? message;
  final dynamic id;
  final dynamic productId;
  final int quantity;
  final String? productName;
  final String? productSubtitle;
  final String? imageUrl;
  final double? price;

  CartModel({
    this.message,
    this.id,
    this.productId,
    this.quantity = 1,
    this.productName,
    this.productSubtitle,
    this.imageUrl,
    this.price,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      message: json['message'],
      id: json['id'],
      productId: json['productId'],
      quantity: json['quantity'] ?? 1,
      productName: json['productName'] ?? json['name'],
      productSubtitle: json['productSubtitle'],
      imageUrl: json['imageUrl'] ?? json['coverPictureUrl'],
      price: (json['price'] as num?)?.toDouble(),
    );
  }
}
