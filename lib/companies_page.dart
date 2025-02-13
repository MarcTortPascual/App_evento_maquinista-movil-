import 'package:app_maquinista/custom_widgets/page.dart';
import 'package:app_maquinista/model/companies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Companies_Page extends StatelessWidget{
  Companies_Page({
    super.key,

  });
  List<Companies> companies;

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [];
    
    for (Companies com in companies){
      body.add(
          Card(
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              child:
              ListTile(
                title:
                Row(
                  children: [
                    Image.network(com.img_url,width: 50, height: 50,errorBuilder:
                        (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Icon(Icons.image,size: 50);
                    },

                      ),
                    Column(
                      children: [
                        Text(com.name,style: TextStyle(color: Colors.yellowAccent , fontSize: 20.0),),
                        Text("Contacto: "+com.agent.userName),
                        InkWell(
                          child: Text("Web: " + com.web),
                          onTap: () => launch(com.web) ,
                        )

                      ],
                    ) ,
                  ],
                )


        
              )
          )
      );
    }
    
    return PageMaquinista(tittle: Text("Expositores"), body: Column(children: body,));
  }

}