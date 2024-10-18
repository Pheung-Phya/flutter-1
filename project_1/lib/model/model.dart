class Shop {
  final String image;
  final String name;
  final List sugar;
  final List size;
  final double price;

  Shop(
      {required this.sugar,
      required this.size,
      required this.price,
      required this.image,
      required this.name});
}

List<Shop> list = [
  Shop(sugar: [0,50,100], size: ['S','M','XL'], price: 0.39, image: 'assets/images/phya.jpg', name: 'phya')
];
