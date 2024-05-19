import 'banners_data.dart';

class Banners {
	bool? status;
	List<BannersData>? data;

	Banners({this.status, this.data});

	factory Banners.fromJson(Map<String, dynamic> json) => Banners(
				status: json['status'] as bool?,
				data: (json['data'] as List<dynamic>?)
						?.map((e) => BannersData.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'data': data?.map((e) => e.toJson()).toList(),
			};
}
