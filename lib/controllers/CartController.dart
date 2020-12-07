import 'package:get/get.dart';
import 'package:getx/models/Product.dart';

class CartController extends GetxController {
  var cartItems = List<Product>().obs;

  int get totalNumberOfCartItems => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    cartItems.add(product);
  }
}
