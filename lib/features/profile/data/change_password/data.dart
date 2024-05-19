class Data {
	String? email;

	Data({this.email});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				email: json['email'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'email': email,
			};
}
