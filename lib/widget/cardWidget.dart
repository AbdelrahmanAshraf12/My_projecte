import 'package:flutter/material.dart';

class Cardwidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;

  Cardwidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("\$${price.toStringAsFixed(2)}"),
        trailing: Icon(Icons.delete),
      ),
    );
  }
}
