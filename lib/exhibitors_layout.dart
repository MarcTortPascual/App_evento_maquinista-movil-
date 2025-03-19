import 'package:app_maquinista/custom_widgets/exibitors_card.dart';
import 'package:flutter/material.dart';

import 'custom_widgets/line_painter.dart';
import 'model/projectos.dart';

class ExhibitorsLayout extends StatefulWidget {
  ExhibitorsLayout({super.key,required this.companies});
  @override
  _ExhibitorsLayout createState() => _ExhibitorsLayout();
  List<Companies> companies;
}

class _ExhibitorsLayout extends State<ExhibitorsLayout> {

  List<Proyecto> monlautech = [];

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
                                  "Expositores",
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
                        itemCount: companies.length ,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {

                            },
                            child:
                            ExibitorsCard(
                              company: companies[index],
                            ),
                          );
                        },
                      )),
                ],
              ),
            )
        )
    );
  }
}