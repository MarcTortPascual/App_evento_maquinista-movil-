import 'package:app_maquinista/homePage.dart';
import 'package:flutter/material.dart';
class PageMaquinista extends StatelessWidget{
  PageMaquinista({
    super.key,
    required this.tittle,
    required this.body,
    this.numtabs,
    this.initialindex,
    this.tabs = const PreferredSize(preferredSize: Size(0, 0), child: Scaffold()),
    this.subtittle = const Text(""),
    this.extraActions = const Scaffold()
  });
  Widget tittle;
  Widget subtittle;
  Widget body;
  Widget extraActions;
  PreferredSizeWidget tabs;
  var initialindex;
  var numtabs;
  @override
  Widget build(BuildContext context) {
    if (numtabs != null){
      return DefaultTabController(
          length: numtabs,
          child: Scaffold(
            appBar: AppBar(
              title: Column(children: [tittle,subtittle],),
              bottom: tabs,
            ),
            body: body,
          )
      );
    }
    else{
      return  Scaffold(
        appBar: AppBar(
          title: tittle,
        ),
        body: body,
      );
    }
  }
}