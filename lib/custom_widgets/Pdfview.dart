import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PDFview extends StatefulWidget {
  PDFview({
    super.key,
    required this.url,

  });
  String url;
  @override
  _PDFviewState createState() => _PDFviewState();
}

class _PDFviewState extends State<PDFview> {
  late String _localPath;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _downloadAndLoadPDF();

  }

  Future<void> _downloadAndLoadPDF() async {
    try {
      final response = await http.get(Uri.parse(widget.url));
      final dir = await getTemporaryDirectory(); // Directorio temporal
      final file = File("${dir.path}/temp.pdf");
      await file.writeAsBytes(response.bodyBytes);

      setState(() {
        _localPath = file.path;
        _isLoading = false;
      });
    } catch (e) {
      print("Error descargando PDF: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    // Eliminar el archivo descargado si es desde una URL

    final file = File(_localPath);
    if (file.existsSync()) {
      file.deleteSync();
      print("Archivo eliminado: $_localPath");
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : PDFView(
        filePath: _localPath,

        onRender: (pages) {
          print("Total de páginas: $pages");
        },
        onError: (error) {
          print("Error renderizando PDF: $error");
        },
        onPageChanged: (page, total) {
          print("Página actual: $page, Total: $total");
        },
      ),
    );
  }
}


