class SearchModel {
  final String name;
  final String image;

  SearchModel({required this.name, required this.image});

  Map<String, dynamic> toJson() {
    return {"name": name, "image": image};
  }

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(name: json["name"], image: json["image"]);
  }
}
