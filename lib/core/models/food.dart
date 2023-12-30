class Food {
  final String id;
  final String foodColor;
  final String description;
  final String imageUrl;
  final String name;
  final double price;
  final String rate;
  final String itsType;
  final String weight;
  int quantity;
  bool favorite;
  bool cart;
  Food({
    required this.id,
    required this.foodColor,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rate,
    required this.itsType,
    required this.weight,
    required this.quantity,
    required this.favorite,
    required this.cart,
  });
}
