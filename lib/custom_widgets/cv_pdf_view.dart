import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Pdfview.dart';

class CvPdfView extends StatelessWidget {
  String url;

  CvPdfView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        backgroundColor: Colors.white,
        child: Container(
            padding: const EdgeInsets.all(6),
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: PDFview(url: url)),
                ElevatedButton(
                    onPressed: () async {
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('No se pudo abrir el enlace')),
                        );
                      }
                    },
                    child: const Text("See CV"))
              ],
        ),
        )
    );
  }
}
