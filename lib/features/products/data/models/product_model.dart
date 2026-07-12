class ProductListResponse {
  final List<ProductItem> items;
  final int page;
  final int pageSize;
  final int totalCount;
  final bool hasNextPage;
  final bool hasPreviousPage;

  ProductListResponse({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    return ProductListResponse(
      items: json['items'] != null 
          ? (json['items'] as List).map((e) => ProductItem.fromJson(e)).toList()
          : [],
      page: json['page'] ?? 1,
      pageSize: json['pageSize'] ?? 10,
      totalCount: json['totalCount'] ?? 0,
      hasNextPage: json['hasNextPage'] ?? false,
      hasPreviousPage: json['hasPreviousPage'] ?? false,
    );
  }
}

class ProductItem {
  final String id;
  final String productCode;
  final String name;
  final String description;
  final String arabicName;
  final String arabicDescription;
  final String coverPictureUrl;
  final List<String> productPictures;
  final int price;
  final int stock;
  final int weight;
  final String color;
  final int rating;
  final int reviewsCount;
  final int discountPercentage;
  final String sellerId;
  final List<String> categories;

  ProductItem({
    required this.id,
    required this.productCode,
    required this.name,
    required this.description,
    required this.arabicName,
    required this.arabicDescription,
    required this.coverPictureUrl,
    required this.productPictures,
    required this.price,
    required this.stock,
    required this.weight,
    required this.color,
    required this.rating,
    required this.reviewsCount,
    required this.discountPercentage,
    required this.sellerId,
    required this.categories,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      id: json['id']?.toString() ?? "",
      productCode: json['productCode']?.toString() ?? "",
      name: json['name'] ?? "Unknown",
      description: json['description'] ?? "",
      arabicName: json['arabicName'] ?? "",
      arabicDescription: json['arabicDescription'] ?? "",
      coverPictureUrl: json['coverPictureUrl'] ?? "",
      productPictures: json['productPictures'] != null 
          ? List<String>.from(json['productPictures']) 
          : [],
      price: (json['price'] as num? ?? 0).toInt(),
      stock: (json['stock'] as num? ?? 0).toInt(),
      weight: (json['weight'] as num? ?? 0).toInt(),
      color: json['color']?.toString() ?? "",
      rating: (json['rating'] as num? ?? 0).toInt(),
      reviewsCount: (json['reviewsCount'] as num? ?? 0).toInt(),
      discountPercentage: (json['discountPercentage'] as num? ?? 0).toInt(),
      sellerId: json['sellerId']?.toString() ?? "",
      categories: json['categories'] != null 
          ? List<String>.from(json['categories']) 
          : [],
    );
  }
}
