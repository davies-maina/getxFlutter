import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx/models/Product.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var products = List<Product>().obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'desc about product',
          productImage: 'abd',
          productName: 'Blender'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'desc about product',
          productImage: 'abd',
          productName: 'Heater'),
      Product(
          id: 3,
          price: 50,
          productDescription: 'desc about product',
          productImage: 'abd',
          productName: 'Bulb'),
      Product(
          id: 4,
          price: 60,
          productDescription: 'desc about product',
          productImage: 'abd',
          productName: 'Phone')
    ];

    products.assignAll(productResult);
  }
}
