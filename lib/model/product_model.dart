class Product {
  final String images;
  final String name;
  final double price;
  Product({
    required this.images,
    required this.name,
    required this.price,
  });
  static List<Product> products = [
    Product(images: 'images/anaar.jpg', name: 'Anar', price: 70),
    Product(images: 'images/kiwi.jpg', name: 'Kivi', price: 50),
    Product(images: 'images/apple.jpg', name: 'Apple', price: 25),
    Product(images: 'images/orange.jpg', name: 'Orange', price: 35),
    Product(images: 'images/banana.jpg', name: 'Banana', price: 10),
    Product(images: 'images/grape.jpg', name: 'Grape', price: 60),
    Product(images: 'images/w.jpg', name: 'Watermelon', price: 20),
    Product(images: 'images/chiku1.jpg', name: 'Chikku', price: 40),
  ];
}
