import 'package:flutter/material.dart';
import 'package:shopping_cart/product_list.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Product(),
    );
  }
}
