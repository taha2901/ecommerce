import 'product.dart';

class DataFav {
	int? id;
	ProductFav? product;

	DataFav({this.id, this.product});

	factory DataFav.fromJson(Map<String, dynamic> json) => DataFav(
				id: json['id'] as int?,
				product: json['product'] == null
						? null
						: ProductFav.fromJson(json['product'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'product': product?.toJson(),
			};
}
