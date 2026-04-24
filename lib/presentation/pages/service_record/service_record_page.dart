import 'package:flutter/material.dart';

class ServiceRecordPage extends StatelessWidget {
  const ServiceRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Servis Kayıtları')),
      body: const Center(
        child: Text('Servis kayıtları sayfası içeriği burada olacak.'),
      ),
    );
  }
}
