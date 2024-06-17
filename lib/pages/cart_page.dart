import "package:flutter/material.dart";
import "package:food_order_zn/components/my_cart_tile.dart";
import "package:food_order_zn/models/cart_item.dart";
import "package:food_order_zn/models/restaurant.dart";
import "package:provider/provider.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      //cart
      final userCart = restaurant.cart;

      return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: userCart.isEmpty
            ? Center(
                child: Text("Your cart is empty")) // Handle empty cart case
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: userCart.length,
                      itemBuilder: (context, index) {
                        final cartItem = userCart[index];
                        return MyCartTile(cartItem: cartItem);
                      },
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
