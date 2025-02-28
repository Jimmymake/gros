// import 'dart:collection';

// import 'package:Matrix.sc/views/buyers/nav_screens.dart/widgets/carddesighn.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CartProvider extends ChangeNotifier {
//    final SharedPreferences prefs;
//   CartProvider(this.prefs);

//   final List<carddesighn> _products = [];
//   UnmodifiableListView get mylist => UnmodifiableListView(_products);

//   void addProduct(carddesighn card) {
//     _products.add(card);
//     notifyListeners();
//     print("item aded");
//     // Notify widgets listening to this provider
//   }
// }
// import 'dart:convert';
import 'package:Matrix.sc/views/Pages/nav_screens.dart/widgets/carddesighn.dart';
import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CartProvider extends ChangeNotifier {
  // final SharedPreferences prefs;

  // CartProvider(this.prefs) {
  //   // Load stored products on initialization
  //   // _loadProducts();
  // }
  int numberofitems = 1;
  final List<carddesighn> _products = [];

  UnmodifiableListView get mylist => UnmodifiableListView(_products);
  get price => _products.fold<double>(
      0.0, (previouselement, element) => previouselement += element.price);
  // Add product and save to SharedPreferences
  void addProduct(carddesighn card) {
    EasyLoading.showToast("Item added");
    _products.add(card);
    notifyListeners();
    // _saveProducts();

    print("productaded......");
  }

  void removeitem(carddesighn card) {
    _products.remove(card);
    notifyListeners();
  }

  void itemincrement() {
    numberofitems = numberofitems + 1;
    notifyListeners();
  }

  void itemdecrement() {
    if (numberofitems > 1) {
      numberofitems = numberofitems - 1;
      notifyListeners();
    }
  }

  // Convert list to JSON and save
  // void _saveProducts() {
  //   final jsonString =
  //       jsonEncode(_products.map((product) => product.toJson()).toList());
  //   prefs.setString('products', jsonString);
  // }

  // // Load JSON and convert to objects
  // void _loadProducts() {
  //   final jsonString = prefs.getString('products');
  //   if (jsonString != null) {
  //     final List<dynamic> jsonList = jsonDecode(jsonString);
  //     _products.clear();
  //     _products.addAll(
  //       jsonList.map((item) => carddesighn.fromJson(item)).toList(),
  //     );
  //     notifyListeners();
  //   }
  // }
}
