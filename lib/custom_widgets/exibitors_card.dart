import 'package:app_maquinista/model/companies.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
      child: SizedBox(
        //width: MediaQuery.of(context).size.width * 0.55,
        //height: MediaQuery.of(context).size.height * 0.55,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(company.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: AutoSizeText("Web: ${company.web}", maxLines: 2, style: TextStyle(color:Colors.white, ),),
                  onTap: () => launchUrl(Uri.parse(company.web)) ,
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(company.img_url,height: 100 , width: 100,errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.image_not_supported_rounded,size: 100,color: Colors.white,);
                },)
              ],
            ),
          ],
        ),
      )
    );
  }
}
