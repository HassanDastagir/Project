import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Method to build the header image
  Image _buildJournalHeaderImage() {
    return const Image(
      image: AssetImage('assets/img6.jfif'), // Ensure this image exists in assets
      fit: BoxFit.cover,
    );
  }

  // Method to build the journal entry section
  Column _buildJournalEntry() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text(
          'HD Digital Watches',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        Text(
          'It is a great collection of watches.',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  // Method to build the weather section
  Row _buildJournalWeather() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.wb_sunny, color: Colors.orange, size: 32.0),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('81° Clear', style: TextStyle(color: Colors.deepOrange)),
            Text(
              '4500 San Alpho Drive, Dallas, TX United States',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  // Method to build the tags section
  Wrap _buildJournalTags() {
    return Wrap(
      spacing: 8.0,
      children: List.generate(7, (int index) {
        return Chip(
          label: Text(
            'Gift ${index + 1}',
            style: const TextStyle(fontSize: 10.0, color: Colors.black),
          ),
          avatar: Icon(Icons.card_giftcard, color: Colors.blue.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: const BorderSide(color: Colors.grey),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      }),
    );
  }

  // Method to build the footer images
  Row _buildJournalFooterImages() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CircleAvatar(backgroundImage: AssetImage('assets/img6.jfif'), radius: 40.0),
        CircleAvatar(backgroundImage: AssetImage('assets/img7.jpg'), radius: 40.0),
        CircleAvatar(backgroundImage: AssetImage('assets/img8.jfif'), radius: 40.0),
        SizedBox(
          width: 100.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.shield_moon, color: Colors.pink),
              Icon(Icons.star_border, color: Colors.yellow),
              Icon(Icons.music_note, color: Colors.blue),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jfif'), // Add your background image
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildJournalHeaderImage(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildJournalEntry(),
                    const Divider(),
                    _buildJournalWeather(),
                    const Divider(),
                    _buildJournalTags(),
                    const Divider(),
                    _buildJournalFooterImages(),
                    const Divider(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/product-list');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87, // Set button background to black
                        foregroundColor: Colors.white, // Set button text color to white
                      ),
                      child: const Text('View Products'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Digital Watch Store',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87, // Set AppBar background color to black
        iconTheme: const IconThemeData(color: Colors.white), // Set icon color to white
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.cloud_queue),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildBody(),
    );
  }
}