class OffersModel {
  final String id;
  final String name;
  final String coverul;
  final String description;

  OffersModel({required this.id, required this.name, required this.coverul, required this.description});


  factory OffersModel.fromJson(Map<String,dynamic>json){
    return OffersModel(
      name: json["name"],
      coverul: json["coverUrl"], 
      id: json["id"],
      description: json["description"],
    );
  }

}