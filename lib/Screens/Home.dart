import 'package:flutter/material.dart';
import 'package:project_1/widget/productWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.mobile_friendly, 'title': 'Iphone'},
    {'icon': Icons.computer_outlined, 'title': 'Laptop'},
    {'icon': Icons.watch, 'title': 'Watches'}
  ];

  final List<Map<String, dynamic>> products = [
    {
      'title': 'Laptop',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgI3AygE--AM_cZWe0yfWJTy-8u4pyt4sWhw&s',
      'price': 35000.00
    },
    {
      'title': 'Iphone 13',
      'imageUrl':
          'https://iplanet.one/cdn/shop/files/iPhone_13_Green_PDP_Image_Position-1A__GBEN.jpg?v=1691170460&width=1920',
      'price': 4000.00
    },
    {
      'title': 'Smart Watch',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0YhhD92QdtRS_QDSz5A3f63YRc0mwB_Rk1w&s',
      'price': 7000.00
    },
    {
      'title': 'MacBook Air',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUvoS8UgUcu_25Izhl-t0FF0hp4Cl90n2q_w&s',
      'price': 20000.00
    },
    {
      'title': 'Samsung Galaxy',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAbZpghIb0XnukEVkrCFRWVNoS0eue1jZ_Qg&s',
      'price': 24000.00
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "E_commerce",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      //for row list
                      child: Column(
                        children: [
                          Icon(categories[index]['icon'], size: 32),
                          SizedBox(height: 8),
                          Text(categories[index]['title']),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Our Products",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 4 / 6,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductWidget(
                    title: product['title'],
                    imageUrl: product['imageUrl'],
                    price: product['price'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
