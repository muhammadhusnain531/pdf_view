
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdf_view/book_screen.dart';
void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('PDF Viwer',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor: Colors.blue,),
    body: BookScreen()
    ),);
  }
}