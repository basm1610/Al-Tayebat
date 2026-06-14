class ItemSizeModel {
  final String name;
  final int price;
 
  const ItemSizeModel({
    required this.name,
    required this.price,
  });
 
  factory ItemSizeModel.fromJson(Map<String, dynamic> json) {
    return ItemSizeModel(
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
    );
  }
 
  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
      };
}