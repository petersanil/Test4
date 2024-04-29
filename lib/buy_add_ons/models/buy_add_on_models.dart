import 'package:aquaventure/constants/app_images.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class BuyAddOnModels extends ChangeNotifier {
  String currency;
  int? eventId;
  String iconUrl;
  String name;
  String plu;
  double price;

  // int quantity;
  int? sectionId;
  String status;
  String statusDescription;
  int addedQuantity;
  String selectedSize;
  bool isLoader;

  BuyAddOnModels(
      {required this.currency,
      this.eventId,
      required this.iconUrl,
      required this.name,
      required this.plu,
      required this.price,
      // required this.quantity,
      this.sectionId,
      required this.status,
      required this.statusDescription,
      this.addedQuantity = 0,
      this.selectedSize = '',
      this.isLoader = false,});

  factory BuyAddOnModels.fromJson(Map<String, dynamic> json) {
    return BuyAddOnModels(
        price: (json['price'] ?? 0).toDouble(),
        currency: json["currency"],
        eventId: json["eventId"],
        iconUrl: json["iconUrl"],
        name: json["name"],
        plu: json["plu"],
        addedQuantity: json["addedQuantity"] ?? 0,
        sectionId: json["sectionId"],
        status: json["status"],
        statusDescription: json["statusDescription"],
        isLoader: false);
  }

  Map<String, dynamic> toJson() => {
        "eventId": eventId,
        "name": '"$name"',
        "plu": '"$plu"',
        "price": price,
        "quantity": addedQuantity,
        "sectionId": sectionId,
        // "iconUrl": iconUrl,
        // "currency": currency,
        // "status": status,
        // "statusDescription": statusDescription,
      };

  Map<String, dynamic> toCartJson() => {
    "eventId": eventId,
    "name": name,
    "plu": plu,
    "price": price,
    "addedQuantity": addedQuantity,
    "sectionId": sectionId,
    "iconUrl": iconUrl,
    "currency": currency,
    "status": status,
    "statusDescription": statusDescription,
  };

  double getTotalValue() {
    return addedQuantity * price;
  }

  @override
  List<Object?> get props => [plu];
}
