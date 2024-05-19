class BannersData {
	int? id;
	String? image;

	BannersData({this.id, this.image});

	factory BannersData.fromJson(Map<String, dynamic> json) => BannersData(
				id: json['id'] as int?,
				image: json['image'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'image': image,
			};
}
