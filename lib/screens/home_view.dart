import 'package:flutter/material.dart';
import 'package:today_class/screens/cart_view.dart';
import 'package:today_class/screens/favourite_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map> products = [
    {"name": "pizza", "price": 100, "isfavourite": false},
    {"name": "burger", "price": 100, "isfavourite": false},
    {"name": "cold drink", "price": 100, "isfavourite": false},
    {"name": "sandwish", "price": 100, "isfavourite": false},
    {"name": "club sandwish", "price": 100, "isfavourite": false},
    {"name": "chicken roll", "price": 100, "isfavourite": false},
    {"name": "chat", "price": 100, "isfavourite": false},
    {"name": "zinger roll", "price": 100, "isfavourite": false},
    {"name": "bag", "price": 100, "isfavourite": false},
    {"name": "bag", "price": 100, "isfavourite": false},
    {"name": "bag", "price": 100, "isfavourite": false},
  ];

  List<Map> favourite = [];
  List<Map> cart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Favourite_View(fav: favourite)));
          },
          child: Text("Favourite"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartView(fav: favourite)));
          },
          child: Text("Cart"),
        ),
      ],
      appBar: AppBar(
        title: Text("Hotel"),
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: ((context, index) {
            return ListTile(
              title: Text(products[index]["name"]),
              subtitle: Text(products[index]["price"].toString()),
              trailing: Wrap(
                children: [
                  IconButton(
                      onPressed: () {
                        cart.add(products[index]["isfavourite"]);
                      },
                      icon: Icon(Icons.card_travel)),
                  IconButton(
                    onPressed: () {
                      if (products[index]["isfavourite"] == false) {
                        favourite.add(products[index]);
                        setState(() {
                          products[index]["isfavourite"] = true;
                        });
                      } else {
                        // print("Already added");
                        favourite.removeAt(index);
                        setState(() {
                          products[index]["isfavourite"] =
                              false; //command change
                        });
                      }
                      // setState(() {
                      //   products[index]["isfavourite"] = true;
                      // });
                    },
                    icon: Icon(Icons.favorite,
                        color: products[index]["isfavourite"]
                            ? Colors.red
                            : Colors.black),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
