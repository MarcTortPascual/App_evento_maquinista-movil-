import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PDFview extends StatefulWidget {
  const PDFview({super.key, required this.url});
  final String url;

  @override
  _PDFviewState createState() => _PDFviewState();
}

class _PDFviewState extends State<PDFview> {
  String? _localPath;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _downloadAndLoadPDF();
  }

  Future<void> _downloadAndLoadPDF() async {
    try {
      final response = await http.get(Uri.parse(widget.url));
      if (response.statusCode == 200) {
        final dir = await getTemporaryDirectory();
        final file = File("${dir.path}/temp.pdf");
        await file.writeAsBytes(response.bodyBytes);

        setState(() {
          _localPath = file.path;
          _isLoading = false;
        });
        return;
      }
      throw Exception("Error: Código de respuesta ${response.statusCode}");
    } catch (e) {
      print("Error descargando PDF: $e");
      setState(() {
        _isLoading = false;
      });
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error descargando PDF: $e")),
        );
      }
    }
  }

  @override
  void dispose() {
    if (_localPath != null && _localPath!.isNotEmpty) {
      final file = File(_localPath!);
      if (file.existsSync()) {
        file.deleteSync();
        print("Archivo eliminado: $_localPath");
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _localPath != null
              ? PDFView(
                  filePath: _localPath!,
                  onRender: (pages) => print("Total de páginas: $pages"),
                  onError: (error) => print("Error renderizando PDF: $error"),
                  onPageChanged: (page, total) => print("Página actual: $page, Total: $total"),
                )
              : const Center(
                  child: Icon(Icons.picture_as_pdf, size: 200, color: Colors.red),
                ),
    );
  }
}
