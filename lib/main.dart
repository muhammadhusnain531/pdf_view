
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          ); // Center
        }));
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('PDF Viwer',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor: Colors.blue,),
    body: Column(
      children: [

      ],
    ),
    ),);
  }
}