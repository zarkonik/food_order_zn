import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_order_zn/models/cart_item.dart';

import 'food.dart';

class Restaurant with ChangeNotifier {
  //paznja ovde, mora da dodas ovo da bi radilo ono u main
  final List<Food> _menu = [
    Food(
        name: "Cheeseburger",
        description: "Opis burger",
        imagePath: "lib/images/burgers/burger1.jpg",
        price: 100,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 100),
          Addon(name: "dotdaak 1", price: 200),
          Addon(name: "Extra cheese 2", price: 300),
          Addon(name: "Dodatak 3", price: 400)
        ]),

    Food(
        name: "Burger obican",
        description: "Opis burger",
        imagePath: "lib/images/burgers/burger2.jpg",
        price: 100,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 100),
          Addon(name: "dotdaak 1", price: 200),
          Addon(name: "Extra cheese 2", price: 300),
          Addon(name: "Dodatak 3", price: 400)
        ]),
//desserts
    Food(
        name: "Sladoled",
        description: "Opis sladole",
        imagePath: "lib/images/desserts/dessert1.jpg",
        price: 100,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Extra cheese", price: 100),
          Addon(name: "dotdaak 1", price: 200),
          Addon(name: "Extra cheese 2", price: 300),
          Addon(name: "Dodatak 3", price: 400)
        ]),

    Food(
        name: "Sladoled Kink",
        description: "Opis sladole",
        imagePath: "lib/images/desserts/deserts2.jpg",
        price: 100,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Extra cheese", price: 100),
          Addon(name: "dotdaak 1", price: 200),
          Addon(name: "Extra cheese 2", price: 300),
          Addon(name: "Dodatak 3", price: 400)
        ]),

    //drinks
    Food(
        name: "Pice1",
        description: "Opis pice",
        imagePath: "lib/images/drinks/drink1.jpg",
        price: 100,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Extra cheese", price: 100),
          Addon(name: "dotdaak 1", price: 200),
          Addon(name: "Extra cheese 2", price: 300),
          Addon(name: "Dodatak 3", price: 400)
        ]),

    Food(
        name: "sveps",
        description: "Opis pice",
        imagePath: "lib/images/drinks/drink2.jpg",
        price: 100,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Extra cheese", price: 100),
          Addon(name: "dotdaak 1", price: 200),
          Addon(name: "Extra cheese 2", price: 300),
          Addon(name: "Dodatak 3", price: 400)
        ]),

    //salads
    Food(
        name: "cezar salata",
        description: "Opis pice",
        imagePath: "lib/images/salads/salad1.jpg",
        price: 100,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Extra cheese", price: 100),
          Addon(name: "dotdaak 1", price: 200),
          Addon(name: "Extra cheese 2", price: 300),
          Addon(name: "Dodatak 3", price: 400)
        ]),

    Food(
        name: "cezar salata2",
        description: "Opis pice",
        imagePath: "lib/images/salads/salad2.jpg",
        price: 100,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Extra cheese", price: 100),
          Addon(name: "dotdaak 1", price: 200),
          Addon(name: "Extra cheese 2", price: 300),
          Addon(name: "Dodatak 3", price: 400)
        ]),

    //sides

    Food(
        name: "cips",
        description: "Opis cips",
        imagePath: "lib/images/sides/side1.jpg",
        price: 100,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra cheese", price: 100),
          Addon(name: "dotdaak 1", price: 200),
          Addon(name: "Extra cheese 2", price: 300),
          Addon(name: "Dodatak 3", price: 400)
        ]),
    Food(
        name: "cips2",
        description: "Opis cips2",
        imagePath: "lib/images/sides/side2.jpg",
        price: 100,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra cheese", price: 100),
          Addon(name: "dotdaak 1", price: 200),
          Addon(name: "Extra cheese 2", price: 300),
          Addon(name: "Dodatak 3", price: 400)
        ]),
  ];

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  final List<CartItem> _cart = [];

  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;

      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameAddons && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  void removeFromCard(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
