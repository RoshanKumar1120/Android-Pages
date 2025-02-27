import 'package:flutter/material.dart';
import 'dart:async';

class CarDetailsScreen extends StatefulWidget {
  @override
  _CarDetailsScreenState createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  final List<String> carImages = [
    'assets/car.png',
    'assets/cycle.png',
    'assets/tab.png',
    'assets/laptop.png',
  ];

  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Auto-scroll every 3 seconds
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentIndex < carImages.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }

      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Car Image Slider with Auto Scrolling
          Container(
            margin: EdgeInsets.all(16),
            height: 250,
            child: PageView.builder(
              controller: _pageController,
              itemCount: carImages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        spreadRadius: 2,
                        offset: Offset(2, 4),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(carImages[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),

          // Car Details Section
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mercedes-Benz 700 (2022)",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "2.2 LX HARD TOP MT 4 STR",
                    style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "₹ 23,50,000",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.greenAccent),
                  ),
                  SizedBox(height: 20),
                  Divider(color: Colors.grey[700]),

                  // Buttons
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _customButton("Chat", Icons.chat, Colors.blue, () {}),
                      _customButton("Make Offer", Icons.local_offer, Colors.green, () {}),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom Button Widget
  Widget _customButton(String text, IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      icon: Icon(icon, color: Colors.white),
      label: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}
