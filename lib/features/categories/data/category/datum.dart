class CategoryData {
	int? id;
	String? name;
	String? image;

	CategoryData({this.id, this.name, this.image});

	factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
				id: json['id'] as int?,
				name: json['name'] as String?,
				image: json['image'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'image': image,
			};
}
