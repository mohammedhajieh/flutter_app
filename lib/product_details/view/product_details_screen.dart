import 'package:first_app/utils/widgets/appbar/main_app_bar.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Product Details'),
      body: Center(child: Text('Product Details Screen test')),
    );
  }
}
