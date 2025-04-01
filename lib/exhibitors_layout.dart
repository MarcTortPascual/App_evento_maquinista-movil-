import 'package:app_maquinista/custom_widgets/exibitors_card.dart';
import 'package:app_maquinista/model/companies.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'custom_widgets/line_painter.dart';
import 'main.dart';
import 'model/companies.dart';
import 'model/projectos.dart';

class ExhibitorsLayout extends StatefulWidget {
  ExhibitorsLayout({super.key, required this.companies});
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ListWheelScrollView.useDelegate(
                itemExtent: 250, // Altura de cada elemento
                perspective: 0.003,
                physics: FixedExtentScrollPhysics(
                  parent: BouncingScrollPhysics(), // Efecto de rebote
                ),
                childDelegate: ListWheelChildLoopingListDelegate(
                  children: widget.companies.map((company) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              company.img_url,
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                              height: 10,
                              width: MediaQuery.of(context).size.width * 0.78),
                          Text(
                            company.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: AutoSizeText(
                                  "Web: ${company.web}",
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onTap: () => launchUrl(Uri.parse(company.web)),
                              )),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
