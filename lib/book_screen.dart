import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';  // For saving the PDF temporarily

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  String? pdfPath;

  @override
  void initState() {
    super.initState();
    loadPdf();
  }

  // Function to load the PDF from assets and store it temporarily in the app's directory
  Future<void> loadPdf() async {
    try {
      // Load the PDF file from the assets
      final ByteData data = await rootBundle.load('assets/vit.pdf');
      final Directory tempDir = await getApplicationDocumentsDirectory();
      final File file = File('${tempDir.path}/vit.pdf');

      // Write the PDF data to a temporary file
      await file.writeAsBytes(data.buffer.asUint8List());

      setState(() {
        pdfPath = file.path;  // Update the state with the PDF path
      });
    } catch (e) {
      print("Error loading PDF: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pdfPath != null
            ? PDFView(
          filePath: pdfPath!,  // Provide the file path here
          enableSwipe: true,
        )
            : const CircularProgressIndicator(),  // Show a loading indicator while the PDF is being loaded
      ),
    );
  }
}
