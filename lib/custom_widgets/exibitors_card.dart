import 'package:app_maquinista/model/companies.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExibitorsCard extends StatelessWidget {
  
  Companies  company;

  ExibitorsCard({
    super.key,
    required this.company
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(company.name, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Text("Web: ${company.web}", style: TextStyle(color:Colors.white),),
                onTap: () => launchUrl(Uri.parse(company.web)) ,
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(company.img_url,height: 100 , width: 100,errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.image_not_supported_rounded,size: 100,color: Colors.white,);
              },)
            ],
          ),
          
        ],
      ),
    );
  }
}
