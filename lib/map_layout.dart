import 'package:flutter/material.dart';
import 'custom_widgets/carrousel_img.dart';
import 'custom_widgets/line_painter.dart';

class MapLayout extends StatefulWidget {
  MapLayout({super.key});

  @override
  _MapLayout createState() => _MapLayout();
}

class _MapLayout extends State<MapLayout> {

  final List<String> imgEvent = [
    'assets/img/monlautech1.jpg','assets/img/monlautech2.jpg','assets/img/monlautech3.jpg',
    'assets/img/monlautech4.jpg','assets/img/monlautech5.jpg','assets/img/monlautech6.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SizedBox(
            width: 100,
            height: 90,
            child: Image.asset('assets/img/logomonlau.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
          child: Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    "Mapa de la Zona",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                )
              ])
            ],
          ),
        ),
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: CustomPaint(
                  size: Size(100, 10),
                  painter: LinePainter(),
                )),
          ],
        ),
        SizedBox(
          width: 500,
          height: 270,
          child:
              InteractiveViewer(
             
              panEnabled: true, // permite arrastrar
              boundaryMargin: EdgeInsets.all(20),
              minScale: 1.0,
              maxScale: 4.0,
              child: Image(image: AssetImage("assets/img/Plano.png")),
              scaleEnabled: true,
              
            ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 12.0),
            child: Row(children: [
              SizedBox(
                  width: 200,
                  child: Text(
                    "Imagenes del Evento",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  )),
            ],
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom: 12.0),
              child: CustomPaint(
                size: Size(100, 10),
                painter: LinePainter(),
              )
          ),
          Row(
            children: [Expanded(child: CarrouselImg(imgList: imgEvent))],
          )
        ])
      ]),
    )));
  }
}
