import 'package:aquaventure/buy_add_ons/models/buy_add_on_models.dart';

abstract class BuyAddOnEvent {}

class GetBuyAddOnEvent extends BuyAddOnEvent {}

class HoldItemEvent extends BuyAddOnEvent {
  BuyAddOnModels models;
  int quantity;

  HoldItemEvent({required this.models,required this.quantity});
}

class UnholdItemEvent extends BuyAddOnEvent {
  BuyAddOnModels models;
  int quantity;

  UnholdItemEvent({required this.models,required this.quantity});
}
