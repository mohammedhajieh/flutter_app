import 'dart:developer';

import 'package:first_app/product/view_model/cubit.dart';
import 'package:first_app/product/view_model/state.dart';
import 'package:first_app/utils/widgets/appbar/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.email, required this.password});
  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: MainAppBar(title: 'Product Screen'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ProductCubit, ProductState>(
              buildWhen: (previous, current) {
                return current is ProductChangeFavouirteState;
              },
              builder: (context, state) {
                final cubit = context.read<ProductCubit>();
                log('Bloc Builder Favorite');
                return GestureDetector(
                  onTap: () {
                    cubit.changeFavouirte();
                  },
                  child: Icon(
                    cubit.isFavouirte
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    size: 30,
                    color: Colors.red,
                  ),
                );
              },
            ),
            SizedBox(height: 40),
            Text('Hello World'),
            SizedBox(height: 40),
            Center(
              child: BlocBuilder<ProductCubit, ProductState>(
                buildWhen: (previous, current) {
                  return current is ProductChangeCountState;
                },
                builder: (context, state) {
                  log('Bloc Builder Count');
                  final cubit = context.read<ProductCubit>();
                  return Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          cubit.decremnent();
                        },
                        child: Icon(Icons.remove, size: 30, color: Colors.red),
                      ),
                      Text(
                        '${cubit.count}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          cubit.incremnent();
                        },
                        child: Icon(Icons.add, size: 30, color: Colors.green),
                      ),
                    ],
                  );
                },
              ),
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// ListView.builder(
//         itemCount: responseProduct?.responseProductData.length,
//         itemBuilder: (context, index) {
//           final data = responseProduct?.responseProductData[index];
//           return MainCard(data: data!);
//         },
//       ),
