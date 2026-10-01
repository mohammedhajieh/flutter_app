import 'package:first_app/core/api/api_service.dart';
import 'package:first_app/features/product/model/response_product.dart';

class ProductData {
  final apiService = ApiService();

  ResponseProduct getProduct() {
    final snapshot = apiService.getProduct();
    final responseProduct = ResponseProduct.fromJson(snapshot);
    return responseProduct;
  }
}
