import 'package:app_maquinista/custom_widgets/page.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_maquinista/Events/projectos.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class DetallesProyectos extends StatefulWidget{
  DetallesProyectos({
    super.key,
    required this.proj
  });
  Proyecto proj ;

  @override
  State<DetallesProyectos> createState() => _DetallesProyectosState();
}

class _DetallesProyectosState extends State<DetallesProyectos> {
  var selected_page ;
  @override
  Widget build(BuildContext context) {
    return PageMaquinista(
        tittle: Text(widget.proj.titulo, style: TextStyle(color: Colors.yellow),),
        body:
          TabBarView(
            children: [
              Center(
                child: PresentacionProjecto(proj: widget.proj),
              ),
              Center(
                child:SobreElProyecto(proj: widget.proj),
              ),
              Center(
                child: Text("It's sunny here"),
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
    return Column(
      children: [
        Container(
          width: screenWidth ,
          height: screenHeight/4,
          child: Video(url: proj.videoUrl, autoplay: true, loop: false) ,
        ),

        Image.network(proj.imagenUrl)
      ],
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
class SobreElProyecto extends StatelessWidget{
  SobreElProyecto({
    super.key,
    required this.proj
  });

  Proyecto proj;
  //PDFViewer memoria = PDFDocument.fromURL(proj.memoriaUrl).then({return PDFViewer(document: v);}) ;

  @override
  Widget build(BuildContext context) {

    return Scaffold();

  }
}
/*class _AutorProyecto extends StatelessWidget{
  AutorProyecto({
    super.key
  });
  Widget build(BuildContext context) {}
}*/