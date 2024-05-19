import 'data.dart';

class Home {
	bool? status;
	dynamic message;
	Data? data;

	Home({this.status, this.message, this.data});

	factory Home.fromJson(Map<String, dynamic> json) => Home(
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
