import 'package:flutter/material.dart';
import 'product.dart'; // Import the product model

class CartPage extends StatelessWidget {
  final List<Product> cart;

  CartPage(this.cart);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        backgroundColor: Colors.blueAccent,
      ),
      body: cart.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (ctx, index) {
                final product = cart[index];
                return ListTile(
                  leading: Image.asset(
                    product.imageUrl,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                );
              },
            ),
    );
  }
}
