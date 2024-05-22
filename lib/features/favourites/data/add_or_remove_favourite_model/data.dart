import 'product.dart';

class Data {
  int? id;
  Product? product;

  Data({this.id, this.product});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: (json['id'] as num?)?.toInt(),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product?.toJson(),
      };
}
