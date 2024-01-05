import 'package:flutter/material.dart';
import 'package:http_demo_engindemirog/blocs/cart_bloc.dart';
import 'package:http_demo_engindemirog/const/color.dart';
import 'package:http_demo_engindemirog/const/text_style.dart';

class CartScreen extends StatelessWidget {
  final title = "Sepet";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: Text(
          title,
          style: appbarTextStyle,
        ),
        backgroundColor: appbarBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: iconColor,
            )),
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
            leading: Image.network(cart[index].product.images.first),
            title: Text(
              cart[index].product.title,
              style: productTextStyle,
            ),
            subtitle: Text(cart[index].product.price.toString()),
            trailing: IconButton(
              icon: const Icon(
                Icons.remove_circle,
                color: Colors.red,
                size: 14,
              ),
              onPressed: () {
                cartBloc.removeFromCart(cart[index]);
              },
            ),
          );
        });
  }
}
