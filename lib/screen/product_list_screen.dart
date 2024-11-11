import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_tile.dart';

enum ViewType { list, grid, scroll }

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ViewType _selectedViewType = ViewType.list;

  final List<Product> products = [
    Product(name: 'Digital watch D900', image: 'assets/img1.jfif', price: 1500, description: 'Best watch for connectivity.'),
    Product(name: 'Digital watch I8 ultra', image: 'assets/img2.jfif', price: 2000, description: 'Enjoy immersive audio and plush cushioning for maximum comfort.'),
    Product(name: 'Digital Watch S9 ultra', image: 'assets/img3.jfif', price: 1250, description: 'Unleash powerful battery and display experience.'),
    Product(name: 'Digital watch I9 pro', image: 'assets/img5.jpg', price: 2560, description: 'Best for connectivity and good sound.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: double.infinity, // Keep the container width stretched
        height: MediaQuery.of(context).size.height * 0.8, // Limit the height to 80% of the screen height
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jfif'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Select View: ",
                      style: TextStyle(color: Colors.white),
                    ),
                    DropdownButton<ViewType>(
                      value: _selectedViewType,
                      icon: const Icon(Icons.view_list, color: Colors.white),
                      dropdownColor: Colors.black87,
                      onChanged: (ViewType? newValue) {
                        setState(() {
                          _selectedViewType = newValue!;
                        });
                      },
                      items: ViewType.values.map<DropdownMenuItem<ViewType>>((ViewType value) {
                        return DropdownMenuItem<ViewType>(
                          value: value,
                          child: Text(
                            value == ViewType.list
                                ? 'List View'
                                : value == ViewType.grid
                                ? 'Grid View'
                                : 'Scroll View',
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _buildSelectedView(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedView() {
    switch (_selectedViewType) {
      case ViewType.grid:
        return Container(
          height: MediaQuery.of(context).size.height * 0.6, // Set specific height for the grid view
          width: double.infinity, // Set the width to match the screen width
          padding: const EdgeInsets.all(4.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Keeps 2 items per row
              mainAxisSpacing: 4.0, // Reduced space between rows
              crossAxisSpacing: 4.0, // Reduced space between columns
              childAspectRatio: 1.0, // Aspect ratio for smaller height
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              Product product = products[index];
              return ProductTile(
                product: product,
                onTap: () {
                  Navigator.pushNamed(context, '/product-detail', arguments: product);
                },
              );
            },
          ),
        );

      case ViewType.scroll:
        return SingleChildScrollView(
          child: Column(
            children: products.map((product) {
              return ProductTile(
                product: product,
                onTap: () {
                  Navigator.pushNamed(context, '/product-detail', arguments: product);
                },
              );
            }).toList(),
          ),
        );
      case ViewType.list:
      default:
        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            Product product = products[index];
            return ProductTile(
              product: product,
              onTap: () {
                Navigator.pushNamed(context, '/product-detail', arguments: product);
              },
            );
          },
        );
    }
  }
}
