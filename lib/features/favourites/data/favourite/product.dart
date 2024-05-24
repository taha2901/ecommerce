class ProductFav {
  int? id;
  double? price;
  double? oldPrice;
  double? discount;
  String? image;
  String? name;
  String? description;

  ProductFav({
    this.id, 
    this.price, 
    this.oldPrice, 
    this.discount, 
    this.image, 
    this.name, 
    this.description, 
  });

  factory ProductFav.fromJson(Map<String, dynamic> json) => ProductFav(
    id: json['id'] as int?,
    price: (json['price'] as num?)?.toDouble(), // هنا يتم التحويل إلى double
    oldPrice: (json['old_price'] as num?)?.toDouble(), // هنا يتم التحويل إلى double
    discount: (json['discount'] as num?)?.toDouble(), // هنا يتم التحويل إلى double
    image: json['image'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'price': price,
    'old_price': oldPrice,
    'discount': discount,
    'image': image,
    'name': name,
    'description': description,
  };
}
