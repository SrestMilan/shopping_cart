import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/cart_provider.dart';
import 'package:shopping_cart/product_list.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: Builder(
        builder: (BuildContext context) {
          return const MaterialApp(
            home: Product(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
