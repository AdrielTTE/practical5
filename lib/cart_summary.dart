
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('State Management')),

      body:Center(
        child: Column(
          children: [

            SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.80,

                child: ListView.separated(

                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                       title: Text( cartProvider.itemList[index].Description),

                      onLongPress:(){
                         cartProvider.remove(cartProvider.itemList[index]);
                      },
                    );
                  },

                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },

                  itemCount: cartProvider.itemList.length,

                ),
            ),

            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.20,
              child: Text('Total :'),

            ),

          ]
        )
      )
    );
  }
}
