import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0, // To hide the default AppBar
        ),
        body: HomePage(),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top header with user info and time
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('09:20', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Welcome Back!\nRoshan Maharana', style: TextStyle(fontSize: 16)),
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://example.com/user_image.jpg'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Trade-in and save section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.network(
                    'https://example.com/tradein_image.jpg', // replace with your image
                    width: 60,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Trade-in and save', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text('Enjoy great upfront saving', style: TextStyle(fontSize: 14)),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Learn More'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 16),

          // Shocking Sale section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Shocking Sale', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  children: [
                    SaleItem(imageUrl: 'https://example.com/item1.jpg', text: '15k Sold Out', discount: '50% OFF'),
                    SaleItem(imageUrl: 'https://example.com/item2.jpg', text: '15k Sold Out', discount: '50% OFF'),
                  ],
                ),
              ],
            ),
          ),

          // RM10 off section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.green[100],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Get RM10.00 OFF', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Spend min RM100.00 to get free delivery and promo voucher for your next purchase.'),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Buy Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SaleItem extends StatelessWidget {
  final String imageUrl;
  final String text;
  final String discount;

  SaleItem({required this.imageUrl, required this.text, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(imageUrl, height: 100),
          SizedBox(height: 8),
          Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(discount, style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
    );
  }
}