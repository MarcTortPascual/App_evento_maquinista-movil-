import 'package:app_maquinista/custom_widgets/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_maquinista/model/students.dart';
import 'package:flutter/material.dart';
import 'package:app_maquinista/custom_widgets/Pdfview.dart' as PDF;
class Students_detail_page extends StatelessWidget{
  Students_detail_page({
    super.key,
    required this.student
  });
  Estudents student;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return PageMaquinista(tittle: Text(student.get_all_name()), body:
      Scaffold(

        body:
        Column(
          children: [

            Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child:  Image.network(student.photoName, width: 100, height: 100,errorBuilder:
                          (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return const Icon(Icons.image,size: 50);
                      },)
                    ),

                    Text(student.get_all_name(),)
                  ],
                )
            ),
            Container(
              width: screenWidth,
              height: (screenHeight/3)*2,
              child: PDF.PDFview(url: student.cvLink),
            )

          ],
        )
    ));
  }

}