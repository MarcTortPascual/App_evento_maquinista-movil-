import 'package:app_maquinista/custom_widgets/Pdfview.dart';
import 'package:app_maquinista/custom_widgets/cv_card.dart';
import 'package:app_maquinista/homePage.dart';
import 'package:app_maquinista/model/projectos.dart';
import 'package:app_maquinista/projectos_detalles_page.dart';
import 'package:flutter/material.dart';



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
    final String titlePrj = "Title Project";

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child:  Builder(builder: (context) {
                    
                    //validamos que sea un video de yt
                    if (widget.project.VideoUrl.contains("youtube.com")){
                      return Ytvideo(videoUrl: widget.project.VideoUrl,is_muted: false, );
                    }else{
                      return Icon(Icons.videocam_off, size: 150,);
                    }

                  }

                  ),
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
        body: Text(widget.project.Resumen)
    );
  }

  Widget _buildMemorySection() {
    return Scaffold(
      body: PDFview(url: widget.project.MemoriaUrl)
    );
  }

  Widget _buildAuthorsSection() {
    /*
      Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 10.0),
                child: CVCard(imagePath: '', name: "hola"),
              ),
     */
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Expanded(child: 
          ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: widget.project.Autor.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: CVCard(
                      imagePath: widget.project.Autor[index].photoName,
                      name: widget.project.Autor[index].get_all_name(),
                    )
                  );
                },
              ),
          ),
        ],
      ),
    );
  }
}
