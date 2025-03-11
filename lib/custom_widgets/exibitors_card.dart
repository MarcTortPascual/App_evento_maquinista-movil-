import 'package:flutter/material.dart';

class ExibitorsCard extends StatelessWidget {
  final String name;
  final String description;
  final String hour;
  final String location;

  const ExibitorsCard(
      {super.key,
      required this.name,
      required this.description,
      required this.hour,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(this.description)
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(this.hour, style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(this.location, style: TextStyle(fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }
}
