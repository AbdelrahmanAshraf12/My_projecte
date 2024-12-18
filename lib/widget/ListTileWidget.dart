import 'package:flutter/material.dart';

class ListtileWidget extends StatelessWidget {
  const ListtileWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.function});
  final String title;
  final IconData icon;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(icon),
      trailing: IconButton(
        onPressed: () {
          function();
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
