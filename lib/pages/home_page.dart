import 'package:app/components/grocery_item_tile.dart';
import 'package:app/model/cart_model.dart';
import 'package:app/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CartPage();
        })),
        child: const Icon(Icons.shopping_bag),
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 220, 231, 241),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Good Morning,"),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Lets order fresh groceriers for you",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Fresh Items  day",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
                child: Consumer<CartModel>(builder: (context, value, child) {
              return GridView.builder(
                itemCount: value.shopItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.1),
                itemBuilder: (context, index) {
                  return GroceryItemTile(
                    itemName: value.shopItems[index][0],
                    itemPrice: value.shopItems[index][1],
                    imagePath: value.shopItems[index][2],
                    color: value.shopItems[index][3],
                    onPressed: () {
                      Provider.of<CartModel>(context, listen: false)
                          .addItemsToCart(index);
                    },
                  );
                },
              );
            })),
          ],
        ),
      ),
    );
  }
}
