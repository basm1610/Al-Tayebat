class MenuItemModel {
  final String name;
  final String subtitle;
  final double price;
  final double rating;
  final String imagePath; // use NetworkImage or AssetImage
  MenuItemModel({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.rating,
    required this.imagePath,
  });
}