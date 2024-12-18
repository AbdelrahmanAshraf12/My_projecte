import 'package:flutter/material.dart';
import '../widget/cardWidget.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final List<Map<String, dynamic>> products = [
    {
      'title': 'Laptop',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgI3AygE--AM_cZWe0yfWJTy-8u4pyt4sWhw&s',
      'price': 350.00
    },
    {
      'title': 'Smart Watch',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0YhhD92QdtRS_QDSz5A3f63YRc0mwB_Rk1w&s',
      'price': 299.99
    },
    {
      'title': 'MacBook Air',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUvoS8UgUcu_25Izhl-t0FF0hp4Cl90n2q_w&s',
      'price': 1200.00
    },
    {
      'title': 'Samsung Galaxy',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAbZpghIb0XnukEVkrCFRWVNoS0eue1jZ_Qg&s',
      'price': 999.00
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
            ),
          ),
        ],
        title: Text(
          "MY Cart",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Cardwidget(
                  title: product['title'],
                  imageUrl: product['imageUrl'],
                  price: product['price'],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${products.fold(0.0, (sum, item) => sum + item['price'] as double)}',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Check Out"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
