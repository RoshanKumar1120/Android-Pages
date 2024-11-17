import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as custom_badge;
import 'package:projectlong/welcomescreen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<String> productName = ['Mobile', 'Cycle', 'Laptop', 'Bike', 'Car', 'Tab'];
  List<String> productUnit = ['1', '1', '1', '1', '1', '1'];
  List<int> productPrice = [10000, 5000, 25000, 80000, 1000000, 5000];
  List<String> productImage = [
    'assets/mobile.png',
    'assets/cycle.png',
    'assets/laptop.png',
    'assets/bike.png',
    'assets/car.png',
    'assets/tab.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRODUCT LIST'),
        centerTitle: true,
        actions: [
          Center(
            child: custom_badge.Badge(
              badgeContent: const Text(
                '0',
                style: TextStyle(color: Colors.white),
              ),
              child: const Icon(Icons.chat_bubble),
            ),
          ),
          const SizedBox(width: 20.0),
        ],
      ),
      body: ListView.builder(
        itemCount: productName.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        productImage[index],
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productName[index],
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              r"₹" + productPrice[index].toString(),
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.chat_bubble, color: Colors.white, size: 16),
                                      SizedBox(width: 5),
                                      Text('Chat', style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
