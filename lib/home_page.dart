
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'item.dart';
import 'cart_summary.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    CartProvider cartProvider = Provider.of<CartProvider>( context);

    final List<Item> _catalog = [
      Item(1, "Shoes", 30.00, 'shoes.jpg'),
      Item(2, "Bags", 50.00, 'bags.jpg'),
      Item(3, "Books", 10.00, 'books.jpg'),
      Item(4, "Cake", 20.00, 'cake.jpg'),
      Item(5, "Hats", 15.00, 'hats.jpg'),
      Item(6, "Shirts", 17.00, 'shirts.jpg'),
      Item(7, "Tie", 8.00, 'tie.jpg')

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management'),
     /*   actions: [
          IconButton(
            onPressed: () {
              Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const CartSummary()));
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],*/
      ),



      body: ListView.separated(
        itemCount: _catalog.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/${_catalog[index].Image}'),
            ),
            title: Text(_catalog[index].Description),
            subtitle: Text("RM ${_catalog[index].Price.toStringAsFixed(2)}"),

            trailing: Checkbox(
              value: cartProvider.itemList.contains(_catalog[index]) ,
              onChanged: (value){
                if (value == true){
                  cartProvider.add(_catalog[index]);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '&{catalog[index].Description} added to cart.')
                      ),
                    );

                } else{
                  cartProvider.remove(_catalog[index]);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            '&{catalog[index].Description} removed from cart.')
                    ),
                  );

                }
              },
            ),

          );
        },

        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },



      ),

    );
  }
}
