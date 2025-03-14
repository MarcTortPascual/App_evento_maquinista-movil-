import 'package:flutter/material.dart';
import 'Pdfview.dart';

class CvPdfView extends StatelessWidget {
  String url;
  int index;

  CvPdfView({super.key, required this.url, required this.index});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        backgroundColor: Colors.white,
        child: Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  PDFview(url: url)
              ],
        ),
        )
    );
  }
}
