import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'models/product.dart';
import 'screen/home_screen.dart';
import 'screen/product_list_screen.dart';
import 'screen/product_detail_screen.dart';
import 'screen/login_screen.dart';
import 'screen/signup_screen.dart'; // Add the sign-up screen import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:FirebaseOptions(apiKey: "AIzaSyCKTTTi8RzTPEIlo4vXoMdh0OUfCYBzhBE",
      authDomain: "hd-store-ef0fc.firebaseapp.com",
      projectId: "hd-store-ef0fc",
      storageBucket: "hd-store-ef0fc.firebasestorage.app",
      messagingSenderId: "477265545245",
      appId: "1:477265545245:web:ec71dc821f72763fabdef4")); // Initialize Firebase
  runApp(DigitalWatchStoreApp());
}

class DigitalWatchStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Watch Store',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/product-list': (context) => ProductListScreen(),
        '/product-detail': (context) {
          final product = ModalRoute.of(context)!.settings.arguments as Product;
          return ProductDetailScreen(product: product);
        },
        '/login': (context) => LoginScreen(), // Add the login route
        '/signup': (context) => SignupScreen(), // Add the signup route
      },
    );
  }
}
