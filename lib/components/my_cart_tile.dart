import "package:flutter/material.dart";
import "package:food_order_zn/models/cart_item.dart";
import "package:food_order_zn/models/restaurant.dart";
import "package:provider/provider.dart";

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            cartItem.food.imagePath,
                            height: 100,
                            width: 100,
                          )),
                    ],
                  )
                ],
              ),
            ));
  }
}
