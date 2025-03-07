import 'package:app_maquinista/model/projectos.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarrouselPrj extends StatelessWidget {
  List<Proyecto> projects; // Lista de mapas con 'name' y 'author'

  CarrouselPrj({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 3.0,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
      items: projects.map((project) {
        return Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  project.ImagenUrl,
                  fit: BoxFit.cover,
                  width: 200.0,
                  errorBuilder:
                    (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return const Icon(Icons.image_not_supported,size: 100);
                  },

                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        project.Titulo ?? "Sin Nombre",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(0.6),
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text(
                        project.Autor[0].name ?? "Autor Desconocido", //  Extraemos el autor
                        style: TextStyle(
                          color:Colors.white60,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
