class Product {
  int? id;
  int? category;
  String? name;
  String? img;
  double? price;
  String? providerName;
  List<String> images=[];

  Product({this.id,this.category, this.name, this.img, this.price, this.providerName});
  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "category": category == null ? null : category,
    "name": name == null ? null : name,
    "img": img == null ? null : img,
    "price": price == null ? null : price,
    "providerName": providerName == null ? null : providerName,
  };
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"] == null ? null : int.parse(json["id"].toString()),
    category: json["category"] == null ? null : json["category"],
    name: json["name"] == null ? null : json["name"].toString(),
    img: json["img"] == null ? null : json["img"].toString(),
    price: json["price"] == null ? null : double.parse(json["price"].toString()),
    providerName: json["providerName"] == null ? null : json["providerName"].toString(),

  );
}
