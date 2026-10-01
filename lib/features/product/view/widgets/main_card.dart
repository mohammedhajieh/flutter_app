import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_app/features/product/model/response_product_data.dart';
import 'package:first_app/features/product_details/view/product_details_screen.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.data});
  final ResponseProductData data;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailsScreen();
            },
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(12),
        clipBehavior: Clip.antiAlias,
        color: Colors.grey.shade100,
        child: Row(
          children: [
            CachedNetworkImage(
              height: 120,
              width: 150,
              imageUrl: data.image ?? '',
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name ?? 'Nothing',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    data.category ?? 'Nothing',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${data.price} \$',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
