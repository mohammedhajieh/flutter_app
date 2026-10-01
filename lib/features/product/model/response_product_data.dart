class ResponseProductData {
  final String? id;
  final String? name;
  final double? price;
  final String? currency;
  final String? category;
  final int? stock;
  final bool? inStock;
  final String? image;

  ResponseProductData({
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
    required this.category,
    required this.stock,
    required this.inStock,
    required this.image,
  });

  factory ResponseProductData.fromJson(Map<String, dynamic> json) {
    return ResponseProductData(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      currency: json['currency'],
      category: json['category'],
      stock: json['stock'],
      inStock: json['in_stock'],
      image: json['image'],
    );
  }
}
