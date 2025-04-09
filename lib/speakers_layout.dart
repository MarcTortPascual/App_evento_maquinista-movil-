import 'package:app_maquinista/custom_widgets/line_painter.dart';
import 'package:app_maquinista/custom_widgets/pop_up_speaker_card.dart';
import 'package:app_maquinista/custom_widgets/speakers_card.dart';
import 'package:app_maquinista/model/meetings.dart';
import 'package:app_maquinista/model/speakers.dart';
import 'package:flutter/material.dart';

class SpeakersLayout extends StatefulWidget {
  SpeakersLayout({super.key, required this.ponencias});

  List<Meetings> ponencias;

  @override
  _SpeakersLayout createState() => _SpeakersLayout();
}

class _SpeakersLayout extends State<SpeakersLayout> {
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
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: widget.ponencias.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SpeakersPopUpCArd(
                                speakers: widget.ponencias[index].speakers[0]);
                          });
                    },
                    child: Container(
                      width: 250,
                      padding: const EdgeInsets.all(10.0),
                      child: SpeakerCard(
                        ponencia: widget.ponencias[index],
                      ),
                    ),
                  );
                },
              )),
              Padding(
                padding: const EdgeInsets.only(left: 13.0, top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 500,
                            child: Text(
                              "Pruebas Dinamicas",
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
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: widget.ponencias.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SpeakersPopUpCArd(
                                speakers: widget.ponencias[index].speakers[0]);
                          });
                    },
                    child: SpeakerCard(
                      ponencia: widget.ponencias[index],
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
