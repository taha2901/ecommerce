class Product {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;
  String? name; // أضف هذا السطر

  Product({this.id, this.price, this.oldPrice, this.discount, this.image, this.name}); // أضف name هنا

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: (json['id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      oldPrice: (json['old_price'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      image: json['image'] as String?,
      name: json['name'] as String?, // أضف هذا السطر
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
        'name': name, // أضف هذا السطر
      };
}
