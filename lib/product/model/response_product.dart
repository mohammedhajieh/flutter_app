import 'package:first_app/product/model/response_product_data.dart';
import 'package:first_app/product/model/response_user.dart';

class ResponseProduct {
  final String? status;
  final String? message;
  final ResponseUser? responseUser;
  final List<ResponseProductData> responseProductData;

  ResponseProduct({
    required this.status,
    required this.message,
    required this.responseUser,
    required this.responseProductData,
  });

  factory ResponseProduct.fromJson(Map<String, dynamic> json) {
    final List<ResponseProductData> productdata = [];
    for (var data in json['products']) {
      productdata.add(ResponseProductData.fromJson(data));
    }
    return ResponseProduct(
      message: json['message'],
      status: json['status'],
      responseUser: ResponseUser.fromJson(json['user']),
      responseProductData: productdata,
    );
  }
}
