class Product {
  final String name;
  final double price;
  Product({
    required this.name,
    required this.price,
  });
  static List<Product> products = [
    Product(name: 'Anar', price: 70),
    Product(name: 'Kivi', price: 50),
    Product(name: 'Apple', price: 25),
    Product(name: 'Orange', price: 35),
    Product(name: 'Banana', price: 10),
    Product(name: 'Grape', price: 60),
    Product(name: 'Watermelon', price: 20),
    Product(name: 'Chikku', price: 40),
  ];
}
