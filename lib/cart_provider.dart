import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountProvider with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  double _totalprice = 0;
  double get totalprice => _totalprice;

// for holding data
  void _setPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); // instance of share prefrences 
    prefs.setInt('shop_item', _counter);
    prefs.setDouble('total_price', _totalprice);
    notifyListeners();
  }

  void _getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('shop_item') ?? 0;
    _totalprice = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  void addCount() {
    _counter++;
    _setPrefs();
    notifyListeners();
  }

  void removeCount() {
    _counter--;
    _setPrefs();
    notifyListeners();
  }

  int getValue() {
    _getPrefs();
    return _counter;
  }

  void addTotalPrice(double totalPrice) {
    _totalprice=_totalprice+totalprice;
    _setPrefs();
    notifyListeners();
  }

  void removePrice(double toalPrice) {
    _totalprice=_totalprice+totalprice;
    _setPrefs();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefs();
    return _totalprice;
  }
}
