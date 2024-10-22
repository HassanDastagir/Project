import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_tile.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        name: 'Digital watch D900',
        image: 'assets/img1.jfif',
        price: 1500,
        description: 'Best watch for connectivity.',
      ),
      Product(
        name: 'Digital watch I8 ultra',
        image: 'assets/img2.jfif',
        price: 2000,
        description: 'Enjoy immersive audio and plush cushioning for maximum comfort.',
      ),
      Product(
        name: 'Digital Watch S9 ultra',
        image: 'assets/img3.jfif',
        price: 1250,
        description: 'Unleash powerful battery and display experience.',
      ),
      Product(
        name: 'Digital watch I9 pro',
        image: 'assets/img5.jpg',
        price: 2560,
        description: 'Best for connectivity and good sound.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.jfif'),  // Add your background image here
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Product List
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  Product product = products[index];
                  return ProductTile(
                    product: product,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(product: product),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
