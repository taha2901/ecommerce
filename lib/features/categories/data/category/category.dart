import 'data.dart';

class Category {
	bool? status;
	dynamic message;
	Data? data;

	Category({this.status, this.message, this.data});

	factory Category.fromJson(Map<String, dynamic> json) => Category(
				status: json['status'] as bool?,
				message: json['message'] as dynamic,
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'data': data?.toJson(),
			};
}
