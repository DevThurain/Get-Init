import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Page')),
      body: Container(),
    );
  }
}