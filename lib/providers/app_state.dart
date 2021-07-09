
import 'package:chiedoziedivine/models/Product.dart';
import 'package:chiedoziedivine/services/apiService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class AppState with ChangeNotifier {
  ApiService apiService = new ApiService();
  Product _product;
  bool isLoading = false;
  int _counter = 1;
  int _totalPrice = 0;
  List<int> _selectedMultiSelectListItem = [];
  int _selectedSingleSelectListItem;

  Product get product => _product;

  int get totalPrice => _totalPrice;

  int get counter => _counter;

  List<int> get selectedMultiSelectListItem => _selectedMultiSelectListItem;

  int get selectedSingleSelectListItem => _selectedSingleSelectListItem;

  set selectedSingleSelectListItem(int selection) {
    _selectedSingleSelectListItem = selection;
    notifyListeners();
  }

  void incrementCounter() {
    _counter++;
    _totalPrice = _product.price * counter;
    notifyListeners();
  }

  void decrementCounter() {
    if (counter > 1) {
      _counter--;
      _totalPrice = _product.price * counter;
      notifyListeners();
    }
  }

  void loadData(BuildContext context) async {
    _product = await apiService.readProductFromJSON(context);
    _totalPrice = _product.price;
    notifyListeners();
  }
}
