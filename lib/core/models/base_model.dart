
class BaseModel {
  BaseModel({
    required this.message,
    required this.status,
  });

  String message;
  String status;

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}
