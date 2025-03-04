import 'package:flutter/material.dart';

class CVCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final double imageSize;

  const CVCard({
    super.key,
    required this.imagePath,
    required this.name,
    this.imageSize = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12), // Bordes redondeados
          child: Image.asset(
            imagePath,
            width: imageSize,
            height: imageSize,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
