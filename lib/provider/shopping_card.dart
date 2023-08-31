import 'package:flower/model/prodect.dart';
import 'package:flutter/material.dart';

class Shopping_card with ChangeNotifier {
  List PRoducts = [];
  int price = 0;

  add(Item product) {
    PRoducts.add(product);
    price += product.price.round();
    notifyListeners();
  }

  delete(Item product) {
    PRoducts.remove(product);
    price -= product.price.round();
    notifyListeners();
  }
}
