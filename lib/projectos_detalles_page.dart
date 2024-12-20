import 'package:app_maquinista/autores_detalles.dart';
import 'package:app_maquinista/custom_widgets/page.dart';
import 'package:app_maquinista/model/students.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_maquinista/model/projectos.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:app_maquinista/custom_widgets/Pdfview.dart' as PDF;
class DetallesProyectos<T extends Proyecto> extends StatefulWidget{
  DetallesProyectos({
    super.key,
    required this.proj
  });
  T proj ;

  @override
  State<DetallesProyectos> createState() => _DetallesProyectosState();
}

class _DetallesProyectosState extends State<DetallesProyectos> {
  var selected_page ;
  @override
  Widget build(BuildContext context) {
    return PageMaquinista(
        tittle: Text(widget.proj.Titulo, style: TextStyle(color: Colors.yellow),),
        subtittle: Text(widget.proj.Autor[0].get_all_name(), style: TextStyle(color: Colors.grey),),
        body:
          TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Center(
                child: PresentacionProjecto(proj: widget.proj),
              ),
              Center(
                child:PDF.PDFview(url: widget.proj.MemoriaUrl),
              ),
              Center(
                child: AutorProyecto(students: widget.proj.Autor),
              ),
            ],
          ),
        numtabs: 3,
        tabs: TabBar(tabs: [
          Tab(
            text: "Presentación",
          ),
          Tab(
            text: "Memoria",
          ),
          Tab(
            text: "Autor",
          ),
        ],)
      );
  }
}

class PresentacionProjecto extends StatelessWidget{
  PresentacionProjecto({
    super.key,
    required this.proj
  });
  Proyecto proj;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return
      Column(
        children: [
        Wrap(
        spacing: screenWidth/3, // Espacio horizontal entre botones
        runSpacing: screenHeight/4, // Espacio vertical en caso de wrap

        alignment: WrapAlignment.center,
        children: [
          Container(
            width: screenWidth,
              height: screenHeight/2,
              child:
                Video(url: proj.videoUrl, autoplay: true, loop: true),
              ),
          Container(

            child: Text(proj.resumen),
          )
        ],
      )]
    );

  }
}
class Video extends StatefulWidget{
  Video({
    super.key,
    required this.url,
    required this.autoplay,
    required this.loop
  });
  String url = "";
  bool loop = false ;
  bool autoplay = true;
  @override
  _VideoState createState() => _VideoState();
}
class _VideoState extends State<Video>{
  VideoPlayerController? controler;
  ChewieController? cw_controler;
  bool isPlaying = false;


  @override
  void dispose(){
    controler!.dispose();
    cw_controler!.dispose();
    super.dispose();
  }
  void _inizializePlayer(){
    controler  = VideoPlayerController.networkUrl(Uri.parse(widget.url));

    controler!.initialize().then((_){
      cw_controler = ChewieController(
          videoPlayerController: controler!,
          autoPlay: widget.autoplay,
          looping: widget.loop

      );
      setState(() {
        isPlaying = true;
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    VideoPlayerController controler = VideoPlayerController.networkUrl(Uri.parse(widget.url));
    controler.initialize();
    cw_controler = ChewieController(
      videoPlayerController: controler,
      autoPlay: widget.autoplay,
      looping: widget.loop,
    );
    if (cw_controler != null){
      return Scaffold(
          body: Chewie(
            controller: cw_controler!,
          )
      );
    }else{
      return Scaffold();
    }

  }
}



class AutorProyecto extends StatelessWidget{
  AutorProyecto({
    super.key,
    required this.students,
  });
  List<Estudents> students;
  Widget build(BuildContext context) {
    List<Widget> children = [];
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    if (students.length != 1 ){
      for (var student in students){
        children.add(
            ListTile(
              title:
              Column(
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Row(
                            children: [
                              Container(
                                  height: screenHeight/10,

                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child:  Image.network(student.photoName, width: 50, height: 50),
                                      ),

                                      Text(student.get_all_name()),
                                    ],
                                  )
                              )
                            ]
                        )
                    )]),
              onTap:
                  ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Students_detail_page(student: student)))
              },
            )
        );

      }
      return ListView(children: children,);
    }else{
      return  Scaffold(

          body:
          Column(
            children: [

              Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:  Image.network(students.first.photoName, width: 100, height: 100,),
                      ),

                      Text(students.first.get_all_name(),)
                    ],
                  )
              ),
              Container(
                width: screenWidth,
                height: (screenHeight/3)*2,
                child: PDF.PDFview(url: students.first.cvLink),
              )

            ],
          )
      );
    }

  }
}