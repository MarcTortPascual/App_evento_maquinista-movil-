import 'package:app_maquinista/custom_widgets/line_painter.dart';
import 'package:app_maquinista/custom_widgets/speakers_card.dart';
import 'package:app_maquinista/model/meetings.dart';
import 'package:flutter/material.dart';

class SpeakersLayout extends StatefulWidget {
  SpeakersLayout({
    super.key,
    required this.ponencias
    });

  List<Meetings> ponencias;

  @override
  _SpeakersLayout createState() => _SpeakersLayout();
}

class _SpeakersLayout extends State<SpeakersLayout> {

  /*final List<Map<String, String>> items = [
    {
      "title": "Titulo ponencia 1",
      "hour": "10:00",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 2",
      "hour": "10:00",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 3",
      "hour": "10:00",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 4",
      "hour": "10:00",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 5",
      "hour": "10:00",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 6",
      "hour": "10:00",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 7",
      "hour": "10:00",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 8",
      "hour": "10:00",
      "author": "Autores.",
    },
    {
      "title": "Titulo ponencia 9",
      "hour": "10:00",
      "author": "Autores.",
    },
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 110,
                child: Image.asset('assets/img/logomonlau.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              "Ponencias",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                          const SizedBox(width: 110),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CustomPaint(
                    size: Size(100, 10),
                    painter: LinePainter(),
                  )
                ],
              ),
              Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: widget.ponencias.length,
                    itemBuilder: (context, index) {

                      return InkWell(
                        onTap: () {

                        },
                        child:
                        SpeakerCard(
                            ponencia: widget.ponencias[index],
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}