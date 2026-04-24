import 'package:flutter/material.dart';

class PdfArchivePage extends StatelessWidget {
  const PdfArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Arşivi')),
      body: const Center(
        child: Text('PDF arşivi sayfası içeriği burada olacak.'),
      ),
    );
  }
}
