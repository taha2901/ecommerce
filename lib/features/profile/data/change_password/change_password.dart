import 'data.dart';

class ChangePassword {
	bool? status;
	String? message;
	Data? data;

	ChangePassword({this.status, this.message, this.data});

	factory ChangePassword.fromJson(Map<String, dynamic> json) {
		return ChangePassword(
			status: json['status'] as bool?,
			message: json['message'] as String?,
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'data': data?.toJson(),
			};
}
