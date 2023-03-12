import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/cart_model.dart';
import 'package:shopping_cart/cart_provider.dart';
import 'package:shopping_cart/db.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  DBHelper? helper = DBHelper();
  List<String> fruitName = [
    'Mango',
    'Orange',
    'Grapes',
    'Banana',
    'Chery',
    'Peach',
    'Mixed Fruit Basket',
  ];
  List<String> productUnit = [
    'KG',
    'Dozen',
    'KG',
    'Dozen',
    'KG',
    'KG',
    'KG',
  ];
  List<int> price = [10, 20, 30, 40, 50, 60, 70];
  List<String> productsImage = [
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg',
    'https://image.shutterstock.com/image-photo/orange-fruit-slices-leaves-isolated-600w-1386912362.jpg',
    'https://image.shutterstock.com/image-photo/green-grape-leaves-isolated-on-600w-533487490.jpg',
    'https://media.istockphoto.com/photos/banana-picture-id1184345169?s=612x612',
    'https://media.istockphoto.com/photos/cherry-trio-with-stem-and-leaf-picture-id157428769?s=612x612',
    'https://media.istockphoto.com/photos/single-whole-peach-fruit-with-leaf-and-slice-isolated-on-white-picture-id1151868959?s=612x612',
    'https://media.istockphoto.com/photos/fruit-background-picture-id529664572?s=612x612',
  ];

  @override
  Widget build(BuildContext context) {
    final cart_provider = Provider.of<CountProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product List'),
        actions: [
          Center(
            child: Badge(
              label: Consumer<CountProvider>(
                builder: (context, value, child) {
                  return Text(value.getValue().toString());
                },
              ),
              child: Icon(Icons.shopping_bag),
            ),
          ),
          SizedBox(
            width: 20.0,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: productsImage.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image(
                                  height: 100,
                                  width: 100,
                                  image: NetworkImage(
                                    productsImage[index].toString(),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        fruitName[index].toString(),
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        productUnit[index].toString() +
                                            " " +
                                            r"$" +
                                            price[index].toString(),
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.green,
                                            ),
                                            onPressed: () {
                                              helper!
                                                  .insert(
                                                Cart(
                                                  id: index,
                                                  productId: index.toString(),
                                                  productName: fruitName[index]
                                                      .toString(),
                                                  initialPrice: price[index],
                                                  productPrice: price[index],
                                                  quantity: 1,
                                                  unitTag: productUnit[index]
                                                      .toString(),
                                                  image: productsImage[index]
                                                      .toString(),
                                                ),
                                              )
                                                  .then((value) {
                                                print(
                                                    'product is added to cart');

                                                cart_provider.addTotalPrice(
                                                    double.parse(price[index]
                                                        .toString()));
                                                cart_provider.addCount();
                                              }).onError((error, stackTrace) {
                                                print(error.toString());
                                              });
                                            },
                                            child: Text('Add to Cart')),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
