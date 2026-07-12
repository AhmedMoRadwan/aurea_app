class ProductsModel {
  final String coverPictureUrl,name;
  final double price;
  final String id;

  ProductsModel({required this.coverPictureUrl, required this.name, required this.price,required this.id});

 factory ProductsModel.fromJson(Map<String,dynamic>json){
    return ProductsModel(
      name: json["name"],
      coverPictureUrl: json["coverPictureUrl"], 
      price: (json["price"] as num).toDouble(),
      id: json["id"],
    );
  }
  
}