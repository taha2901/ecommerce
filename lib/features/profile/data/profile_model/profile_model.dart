import 'data.dart';

class ProfileModel {
	bool? status;
	dynamic message;
	Data? data;

	ProfileModel({this.status, this.message, this.data});

	factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
