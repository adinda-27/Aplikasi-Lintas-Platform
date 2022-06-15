import 'Product.dart';

class Cart {
  final Product product;

  Cart({required this.product});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: demoProducts[0]),
  Cart(product: demoProducts[1]),
  Cart(product: demoProducts[3]),
];
