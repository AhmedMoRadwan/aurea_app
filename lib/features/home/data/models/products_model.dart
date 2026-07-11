class ProductsModel {
  final String coverPictureUrl,name;
  final double price;

  ProductsModel({required this.coverPictureUrl, required this.name, required this.price});

 factory ProductsModel.fromJson(Map<String,dynamic>json){
    return ProductsModel(
      name: json["name"],
      coverPictureUrl: json["coverPictureUrl"], 
      price: json["price"],
    );
  }
  
}