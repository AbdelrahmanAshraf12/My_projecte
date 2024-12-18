import 'package:flutter/material.dart';
import '../widget/productWidget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      'price': 24000.00
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
    final double height = MediaQuery.of(context).size.height; // Size of phone
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search for product",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.1), // 10% of tall screen height
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 4.5 / 7,
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
      ),
    );
  }
}
