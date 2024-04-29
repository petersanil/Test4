class OrderModel {
  Entitlements? entitlements;
  String? status;
  double? total;

  OrderModel({
    this.entitlements,
    this.status,
    this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    entitlements: json["entitlements"] == null ? null : Entitlements.fromJson(json["entitlements"]),
    status: json["status"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "entitlements": entitlements?.toJson(),
    "status": status,
    "total": total,
  };
}

class Entitlements {
  List<Item>? items;

  Entitlements({
    this.items,
  });

  factory Entitlements.fromJson(Map<String, dynamic> json) => Entitlements(
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  int? eventId;
  String? id;
  String? name;
  String? orderId;
  String? plu;
  double? price;
  int? quantity;

  Item({
    this.eventId,
    this.id,
    this.name,
    this.orderId,
    this.plu,
    this.price,
    this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    eventId: json["eventId"],
    id: json["id"],
    name: json["name"],
    orderId: json["orderId"],
    plu: json["plu"],
    price: json["price"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "eventId": eventId,
    "id": id,
    "name": name,
    "orderId": orderId,
    "plu": plu,
    "price": price,
    "quantity": quantity,
  };
}