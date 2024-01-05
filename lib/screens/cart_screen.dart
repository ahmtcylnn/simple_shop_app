import 'package:flutter/material.dart';
import 'package:http_demo_engindemirog/blocs/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sepet"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: cartBloc.getStream,
        initialData: cartBloc.getCart(),
        builder: (context, snapshot) {
          return buildCart(snapshot);
        },
      ),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          final cart = snapshot.data;
          return ListTile(
            title: Text(cart[index].product.title),
            subtitle: Text(cart[index].product.price.toString()),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                cartBloc.removeFromCart(cart[index]);
              },
            ),
          );
        });
  }
}
