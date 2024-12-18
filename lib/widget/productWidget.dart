import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;

  ProductWidget({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            "\$${price.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 14, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
