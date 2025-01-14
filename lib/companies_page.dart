import 'package:app_maquinista/custom_widgets/page.dart';
import 'package:app_maquinista/model/companies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Companies_Page extends StatelessWidget{
  Companies_Page({
    super.key,
    required this.companies
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
                title: Column(
                  children: [
                    Text(com.name,style: TextStyle(color: Colors.yellowAccent , fontSize: 20.0),),
                    Text("Contacto: "+com.agent.userName),
                      
                  ],
                ) ,
        
              )
          )
      );
    }
    
    return PageMaquinista(tittle: Text("Expositores"), body: Column(children: body,));
  }

}