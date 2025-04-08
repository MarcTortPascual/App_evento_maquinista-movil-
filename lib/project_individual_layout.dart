import 'package:app_maquinista/custom_widgets/Pdfview.dart';
import 'package:app_maquinista/custom_widgets/cv_card.dart';
import 'package:app_maquinista/custom_widgets/cv_pdf_view.dart';
import 'package:app_maquinista/model/projectos.dart';
import 'package:app_maquinista/projectos_detalles_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_widgets/line_painter.dart';

class ProjectIndividualLayout extends StatefulWidget {
  Proyecto project;

  ProjectIndividualLayout({super.key, required this.project});

  @override
  _ProjectIndividualLayoutState createState() =>
      _ProjectIndividualLayoutState();
}

class _ProjectIndividualLayoutState extends State<ProjectIndividualLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Builder(builder: (context) {
                //validamos que sea un video de yt
                if (widget.project.VideoUrl.contains("youtube.com")) {
                  return Ytvideo(
                    videoUrl: widget.project.VideoUrl,
                    is_muted: false,
                  );
                } else {
                  return Icon(
                    Icons.videocam_off,
                    size: 150,
                  );
                }
              }),
            ),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: widget.project.Titulo),
                Tab(text: "Memoria"),
                Tab(text: "Autores"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildDetailsSection(),
                  _buildMemorySection(),
                  _buildAuthorsSection()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Scaffold(
        body: Center(
      child:
      Expanded(
          child:
          Column(children: [
            Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 5.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.project.Titulo,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
                    ),
                  ],
                )
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 5.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Descripción del proyecto",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.85),
                    Text(widget.project.Resumen),
                  ],
                )
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 5.0, left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Número de tribunal",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.85),
                  Text(widget.project.Box),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 5.0, left: 5.0),
              child: ElevatedButton(onPressed: _goToEvaluate, child: Text("Evaluar Proyecto")),
            )
          ],
          ),

      ),
    ));
  }

  Widget _buildMemorySection() {
    print(widget.project.MemoriaUrl);
    return Scaffold(body: PDFview(url: widget.project.MemoriaUrl));
  }

  Widget _buildAuthorsSection() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: widget.project.Autor.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CvPdfView(
                              url: widget.project.Autor[index]
                                  .cvLink, /*index: index,*/
                            );
                          });
                    },
                    child: CVCard(
                      imagePath: widget.project.Autor[index].photoName,
                      name: widget.project.Autor[index].get_all_name(),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }

  _goToEvaluate() async {
    final Uri url = Uri.parse(widget.project.UrlEvaluation);
    if (!await launchUrl(url)) {
      throw Exception("Don't work");
    }
  }
}
