
class AppUpdateModel {
  String? androidVersion;
  String? id;
  String? iosVersion;
  bool? mandatoryAppUpdate;

  AppUpdateModel({
    this.androidVersion,
    this.id,
    this.iosVersion,
    this.mandatoryAppUpdate,
  });

  factory AppUpdateModel.fromJson(Map<String, dynamic> json) => AppUpdateModel(
    androidVersion: json["android_version"],
    id: json["id"],
    iosVersion: json["ios_version"],
    mandatoryAppUpdate: json["mandatory_app_update"],
  );

  Map<String, dynamic> toJson() => {
    "android_version": androidVersion,
    "id": id,
    "ios_version": iosVersion,
    "mandatory_app_update": mandatoryAppUpdate,
  };
}
