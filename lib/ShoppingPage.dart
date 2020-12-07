import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/ShoppingController.dart';
import 'package:getx/controllers/CartController.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController =
      Get.put(ShoppingController()); //dependency injection
  final addToCartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        '${controller.products[index].productDescription}'),
                                  ],
                                ),
                                Text('\$${controller.products[index].price}',
                                    style: TextStyle(fontSize: 24)),
                              ],
                            ),
                            RaisedButton(
                              onPressed: () {
                                addToCartController
                                    .addToCart(controller.products[index]);
                              },
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text('Add to Cart'),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            GetX<CartController>(builder: (controller) {
              return Text('Total amount :${controller.totalPrice}');
            }),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: GetX<CartController>(builder: (controller) {
        return FloatingActionButton.extended(
          onPressed: () {},
          label: Text('${controller.totalNumberOfCartItems.toString()}'),
          icon: Icon(Icons.add_shopping_cart_sharp),
        );
      }),
    );
  }
}
