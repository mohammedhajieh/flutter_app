import 'package:first_app/product/model/response_product.dart';
import 'package:first_app/product/view/widgets/main_card.dart';
import 'package:first_app/product/view_model/product_data.dart';
import 'package:first_app/utils/widgets/appbar/main_app_bar.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.email, required this.password});
  final String email;
  final String password;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final productData = ProductData();
  ResponseProduct? responseProduct;
  @override
  void initState() {
    responseProduct = productData.getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(
        title: 'Product Screen',
        leading: GestureDetector(
          onTap: () {
            bool isBack = Navigator.canPop(context);

            if (isBack) {
              Navigator.maybePop(context);
            }
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: responseProduct?.responseProductData.length,
        itemBuilder: (context, index) {
          final data = responseProduct?.responseProductData[index];
          return MainCard(data: data!);
        },
      ),
    );
  }
}
