import 'package:flutter/material.dart';
import 'models/product.dart'; // Ensure this import is correct
import 'screen/home_screen.dart';
import 'screen/product_list_screen.dart';
import 'screen/product_detail_screen.dart';

void main() {
  runApp(DigitalWatchStoreApp());
}

class DigitalWatchStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Watch Store',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/product-list': (context) => ProductListScreen(),
        '/product-detail': (context) {
          final product = ModalRoute.of(context)!.settings.arguments as Product;
          return ProductDetailScreen(product: product);
        },
      },
    );
  }
}
