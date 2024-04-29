class PassesDetailModel {
  int? expirationDate;
  String? guestProfileId;
  int? issuedDate;
  String? owner;
  String? passAccountId;
  String? passDescription;

  PassesDetailModel({
    this.expirationDate,
    this.guestProfileId,
    this.issuedDate,
    this.owner,
    this.passAccountId,
    this.passDescription,
  });

  factory PassesDetailModel.fromJson(Map<String, dynamic> json) =>
      PassesDetailModel(
        expirationDate: json["expiration_date"],
        guestProfileId: json["guest_profile_id"],
        issuedDate: json["issued_date"],
        owner: json["owner"],
        passAccountId: json["pass_account_id"],
        passDescription: json["pass_description"],
      );

  Map<String, dynamic> toJson() => {
        "expiration_date": expirationDate,
        "guest_profile_id": guestProfileId,
        "issued_date": issuedDate,
        "owner": owner,
        "pass_account_id": passAccountId,
        "pass_description": passDescription,
      };
}
