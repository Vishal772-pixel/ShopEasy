import 'package:flutter/material.dart';
import 'product.dart'; // Import the product model
import 'cart_page.dart'; // Import the CartPage

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // List of products
  final List<Product> products = [
    Product(
      id: '1',
      name: 'Wireless Headphones',
      imageUrl: 'assets/Product1.jpg',
      price: 59.99,
    ),
    Product(
      id: '2',
      name: 'Smart Watch',
      imageUrl: 'assets/Product2.jpg',
      price: 129.99,
    ),
    Product(
      id: '3',
      name: 'Laptop Bag',
      imageUrl: 'assets/Product3.jpg',
      price: 39.99,
    ),
    Product(
      id: '4',
      name: 'Bluetooth Speaker',
      imageUrl: 'assets/Product1.jpg',
      price: 89.99,
    ),
  ];

  // List to store items in the cart
  final List<Product> cart = [];

  // Function to add product to the cart
  void addToCart(Product product) {
    setState(() {
      cart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Now"),
        backgroundColor: Colors.blueAccent,
        actions: [
          // Cart Icon with item count
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the Cart Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cart),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Text(
                '${cart.length}', // Show cart item count
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                leading: Image.asset(
                  product.imageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                title: Text(product.name),
                subtitle: Text('\$${product.price}'),
                trailing: ElevatedButton(
                  onPressed: () => addToCart(product),
                  child: Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
