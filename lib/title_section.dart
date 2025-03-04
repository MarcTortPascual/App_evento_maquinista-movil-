import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.title, required this.subtitle, required this.onTitleTap, required this.onSubtitleTap});

  final String title;
  final String subtitle;
  final VoidCallback onTitleTap;
  final VoidCallback onSubtitleTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: GestureDetector(
                  onTap: onTitleTap,
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 115), // Separador entre el título y el subtítulo
          GestureDetector(
            onTap: onSubtitleTap, // Acción cuando se toca el subtítulo
            child: Text(
              subtitle,
              style: const TextStyle(
                color: Color.fromRGBO(0, 82, 158, 1),
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
