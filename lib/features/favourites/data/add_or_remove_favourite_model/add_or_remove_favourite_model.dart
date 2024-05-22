import 'data.dart';

class AddOrRemoveFavouriteModel {
  bool? status;
  String? message;
  Data? data;

  AddOrRemoveFavouriteModel({this.status, this.message, this.data});

  factory AddOrRemoveFavouriteModel.fromJson(Map<String, dynamic> json) {
    return AddOrRemoveFavouriteModel(
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
